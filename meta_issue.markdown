Qs
 - handmade seeds in what lang?

javier corrections
 - delete translations before check resource for errors?


  def merge_translatable_field_options(options, locale)
  end

Re: pt_br -> pt-BR

I've added a test to spec/features/translations_spec.rb: https://github.com/AyuntamientoMadrid/consul/pull/1613/commits/197d03039a5f25f8aa5748acd6aada5fd82196f2

Re: globalize seed data

Judging from existing the seed data (a lot is translated already), I think it does make sense to translate that which is being affected by the Globalize changes to Spanish. I propose doing something like this:

```ruby
# db/dev_seeds/widgets.rb

...
 
  Widget::Card.create!(
    description_en: 'Free software for ...',
    description_es: 'Software libre para ...',
    ...
```

I think this will work well for consul/consul as well. All other available locales fall back to either `:en` or `:es`, so this should provide non-empty content in every case.

I don't know if we would gain anything from putting this content in `config/locales/seeds.rb`. In that case we would have to do `description_es: t('seeds...description', locale: :en)`.


# TODO
 - finish make-colla...
 - push refactor PR, request review

   Note that these changes are built on the PR. The relevant commits are x...x. All previous commits are already included in PR xxx.
   
   Explanation and merge plan coming soon...

   Includes various refactors to code shared by the "translatable" admin-created resources. See commit messages:

 - publish meta-issue
 - open other PRs
 - comment on polls PR


# META-ISSUE

This is a meta-issue for all changes related to making admin-generated content translatable.

Original implementation of the shared "Translatable" code + application of this code to Milestones:
  - [Allow admin generated content to be translatable](https://github.com/AyuntamientoMadrid/consul/pull/1435) (merged)

More issues to apply this general "translatable" code to other resources (I will refer to these as _feature PRs_):

 - [Banners](https://github.com/consul/consul/issues/2738) (merged PR https://github.com/AyuntamientoMadrid/consul/pull/1585)
 - [Participatory budgets](https://github.com/consul/consul/issues/2737#issuecomment-413580923) (put on hold due to incompatibility with current Javascript implementation)
 - [Admin notifications](https://github.com/consul/consul/issues/2742) (open PR https://github.com/AyuntamientoMadrid/consul/pull/1596)
 - [Collaborative legislation](https://github.com/consul/consul/issues/2736) (TODO)
 - [Homepage content](https://github.com/consul/consul/issues/2668) (open PR https://github.com/AyuntamientoMadrid/consul/pull/1588)
 - [Polls](https://github.com/consul/consul/issues/2735) (open PR https://github.com/consul/consul/pull/2833)

Additionally, there are 2 more open PRs with changes to the code that all "translatable" resources share. I will call these _refactor PRs_, to distinguish them from the above _feature PRs_. These changes include the corresponding changes to the resources that are already in master.

  - [Change Translatable implementation to accommodate new requirements](https://github.com/AyuntamientoMadrid/consul/pull/1602#issuecomment-412954579) 
  - [TODO]()

Because a lot of this work has been done this August while master was frozen, there is a lot of unmerged code that depends on these changes.

Instead of waiting for the _refactor PRs_ to be in master to resolve conflicts, I've chosen to incorporate the refactors into the unmerged feature branches (more discussion at https://github.com/AyuntamientoMadrid/consul/pull/1602#issuecomment-412954579).

Here is what the commit graph looks like right now:

Starting from master, there are 2 refactor branches (one following from the other), and then the feature PRs follow in parallel from there.

The idea is to first merge the two refactor PRs (in commit order), then feature the PRs (in any order). Each PR can be rebased over master before merging to keep the commit history on master as linear as possible.

<!--@javierm has been reviewing the changes, and everything seems pretty stable. If anything else comes up, I might suggest opening a new PR instead of changing these.-->

TL;DR Merge in order:

1. https://github.com/AyuntamientoMadrid/consul/pull/1602#issuecomment-412954579

2. TODO

3. In any order:
 - https://github.com/AyuntamientoMadrid/consul/pull/1596
 - TODO
 - https://github.com/consul/consul/issues/2668
 - https://github.com/consul/consul/issues/2735
