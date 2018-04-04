# The Incredible Merchant's Guide to the Galaxy

This is a ruby script which is a guide for any Merchant who wants to travel through the
Galaxy and may need to convert their galaxy units into numerals.

## How to Use It

Run ```bundle install``` to install all dependencies([bundler](https://github.com/bundler/bundler) for more info)
Then run the script on the terminal, inside this project's folder by running:

```bundle exec ruby bin/merchant```

You can also pass an input file as script command argument just like this:

```ruby lib/merchant_on_galaxy.rb /home/any_file.txt```

But please, do follow the input sample file format standards.

## Design Description

- Application's is triggered on the ```./bin/merchant``` file, which gets the console
command's argument(input file).
- The entry point is: MerchantOnGalaxy class, whic is responsible to handle the entire
flow.
- The FileReader class receives the file and extracts specific information from it. Also
validates if file and content are valid, if not raises an error
(InvalidInputError / InvalidContentError).
- Translator class receives file extracted content to generates translated information
such as roman values from galaxy units and mineral value from credits sentences.
- Oracle is the one who answers the questions, with the translated info.
- As helpers, we do have the regex extractors: QuestionInfo and CreditInfo that extracts
information from input file content's sentences.
- NumeralConverter is the file, inside utils folder that converts roman numeral to arabic.

### Flow

- First the application receives an input file.
- Given the input file, reads it into sentences.
- Given the read lines, defines sentences as galaxy units, credits and questions.
- Given the galaxy units, credits and questions it translates it to know their arabic
values.
- Given the translated info with values, it can understand(or not) to answer the
questions.
- Given the answers, can output correctly.

## Ping me if you need

**Email:** mauriciovoto@gmail.com

**Skype:** mauricio.voto

Simple change to test hub's PR creation
