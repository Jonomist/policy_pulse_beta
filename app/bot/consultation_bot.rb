include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

# this presents a quick reply option for people to choice multiple choice options, or click a button
## THIS IS A TEST

Bot.on :message do |message|
  message.typing_on

  message.reply(text: Clause.find(1).content)

  message.reply(
  text: Question.find(1).content
  quick_replies: [
    {
      content_type: 'text',
      title: 'Yo',
      payload: 'HARMLESS'
    },
     {
      content_type: 'text',
      title: 'No',
      payload: 'HARMLESS'
    }
  ]
)
end

## Messenger bot logic

# have a method to execute our consultation

def start_consultation
  # should create a new user object
  # should create a new consultation object
end

# get started menu

def get_started
  # displays instructions and introduction
  # displays a menu of the sections with a get started button (can choose
  # a specific section or get started defaults to section one)
end

# this loops through the selected section with each clause being shown followed by the question method

def section_read
  # loop through the clauses of the selected section
  # ask question series after each clause
  # post responses as Answer object?
end

# consultation questions and answers

# this can potentially be one method with a conditional loop?
# ideally, answers should store as Answer objects with question_id

def ask_first_question
end

def ask_second_question
end

# when user is done with individual sections, it gives them the stage to provide Feedback.new for the legislation

def legislation_feedback
end

### BELOW ARE REFERENCES TO CODE SNIPPETS AND DECISION TREE

## SAMPLE CODE
# here is a sample of some question logic

# def ask_second_question postback
#   postback.reply(
#     attachment: {
#       type: 'template',
#       payload: {
#         template_type: 'button',
#         text: 'This is the second question. It works just like the first one ;)',
#         buttons: [
#           { type: 'postback', title: 'Button one', payload: 'ANSWER_TWO_ONE' },
#           { type: 'postback', title: 'Button two', payload: 'ANSWER_TWO_TWO' },
#           { type: 'postback', title: 'Button three', payload: 'ANSWER_TWO_THREE' }
#         ]
#       }
#     }
#   )
# end

## SAMPLE CODE
# this repeats whatever you type back to you

# Bot.on :message do |message|
#   Bot.deliver({
#     recipient: message.sender,
#     message: {
#       text: message.text
#     }
#   }, access_token: ENV["ACCESS_TOKEN"])
# end

## DECISION TREE

## Written Commands
# 'skip' - skip to the next section
# 'done' - skip to the end and provide feedback on full policy
# 'menu' - go back to the menu of the sections

## Welcome

# Welcome {first_name} to the consultation for the National ICT Innovation and Entrepreneurship Policy Vision. Message me anytime to continue, your input matters!
# Action: Get Started [button]


## Overview
# The vision intends to create a unifying policy vision for transforming Nigeria's economy and accelerating economic growth. The vision is composed of an introduction and four chapters, and you are invited to feedback on specific policy recommendations, on chapters, on the introduction and on the entire policy.

# You will be able to interact with each section and sub-section, if you want to get an overview of the policy at any time type ‘menu’. All of your input on each section is saved as you go. You will be asked two questions before having the opportunity to provide a suggested revision. Write ‘skip’ if you ever want to skip to the next section.
# Action: See Overview [button]

# Menu
# Introduction
# Section 1
# Section 2
# Section 3
# Section 4


## Example

# Introduction (1 of 2): Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.

# Question 1: Do you feel this is representative of your views?
# Options: Yes, No
# Question 2: Does this push the future of Nigeria ICT in the right direction?
# Options: Definitely, Yes, Somewhat, No
# Question 3: Please provide your suggested revision?
# *NLP, we can capture the data of numbers with Facebook built-in NLP


## Action: written response

# Section Review
# **If it is the last sub-section in the section,

# Please provide your general feedback on Section 1: Digital Infrastructure.
# Action: written response


## Policy Review
# Please provide us your overall feedback on the National ICT Innovation and Entrepreneurship Policy Vision.”
# Action: written response


## Completion
# Thank you for your time and participation, blah blah blah.
