project
projectvalidateManPage
  | manPage |
  manPage := TDManPage
    commandName: 'validate'
    fromString:
      'NAME
  project validate - Validate the project registrations

SYNOPSIS
  project validate 

DESCRIPTION

EXAMPLES
  project validate
'.
  ^ manPage