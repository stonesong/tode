project
projectManPage
  | manPage |
  manPage := TDManPage
    commandName: 'project'
    fromString:
      'NAME
  project - Metacello project management support.

SYNOPSIS
  project [--help] <command> [<args>]

DESCRIPTION

  Commands:
    clone    Clone repository (github only)
    commit   Commit the Metacello project
    compare  View differences between repository versions (git only)
    diff     View code differences between image and repository
    entry    Create a new project entry
    list     List Metacello projects
    load     (~/bin/load)
    lock     Lock project registration
    log      Browse commit log for the Metacello project (git only)
    merge    (git only?)
    prime    Prime the project registry
    push     (git only)
    registry Inspect the project registry
    rehome   Point package repository groups for project to new repository
    revert   (see revert in project tool ... just dirty or reload ALL as options)
    status
    test
    validate Validate the project registrations
    workdir  Create working directory for project

  Use `project --help <command>` to read about a specific subcommand.

OPTIONS
  --help [<subCommand>]
    Bring up this man page or a man page for a subCommand.


EXAMPLES
  project --help

'.
  manPage subCommands
    at: 'list' put: self projectlistManPage;
    at: 'prime' put: self projectprimeManPage;
    at: 'registry' put: self projectregistryManPage;
    at: 'validate' put: self projectvalidateManPage;
    at: 'commit' put: self projectcommitManPage;
    at: 'load' put: self projectloadManPage;
    at: 'workdir' put: self projectworkdirManPage;
    at: 'diff' put: self projectdiffManPage;
    at: 'compare' put: self projectcompareManPage;
    at: 'log' put: self projectlogManPage;
    at: 'rehome' put: self projectrehomeManPage;
    at: 'lock' put: self projectlockManPage;
    at: 'clone' put: self projectcloneManPage;
    at: 'entry' put: self projectentryManPage;
    yourself.
  ^ manPage