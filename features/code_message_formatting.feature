Feature: Code message formatting
    As a user, I want to send some words or all message in code

    Background:
        Given My timezone is "Asia/Bishkek"
        And Fake slack db is empty
        And I am on "fake slack ui" page

    Scenario: Only one word in code
        And I type "`code`"
        When I press the "Enter" keyboard button
        Then I should see "code" in "Message body"
        And Message has the following HTML content at "last" position in "Message body":
            | html content                             |
            | <code class="c-mrkdwn__code">code</code> |

    Scenario: Two words in code
        And I type "`some code`"
        When I press the "Enter" keyboard button
        Then I should see "some code" in "Message body"
        And Message has the following HTML content at "last" position in "Message body":
            | html content                                  |
            | <code class="c-mrkdwn__code">some code</code> |
    
    Scenario: Two code blocks one by one
        And I type "`code1` `code2`"
        When I press the "Enter" keyboard button
        Then I should see "code1 code2" in "Message body"
        And Message has the following HTML content at "last" position in "Message body":
            | html content                                                                        |
            | <code class="c-mrkdwn__code">code1</code> <code class="c-mrkdwn__code">code2</code> |

    Scenario: Include any count of ` from the end
        And I type "`code1````"
        When I press the "Enter" keyboard button
        Then I should see "code1```" in "Message body"
        And Message has the following HTML content at "last" position in "Message body":
            | html content                                 |
            | <code class="c-mrkdwn__code">code1```</code> |

    Scenario: Preserve spaces
        And I type "`  code   `"
        When I press the "Enter" keyboard button
        Then I should see "code" in "Message body"
        And Message has the following HTML content at "last" position in "Message body":
            | html content                                  |
            | <code class="c-mrkdwn__code">  code   </code> |

    Scenario: Ignore strike formatting symbol inside
        And I type "`~code~`"
        When I press the "Enter" keyboard button
        Then I should see "~code~" in "Message body"
        And Message has the following HTML content at "last" position in "Message body":
            | html content                               |
            | <code class="c-mrkdwn__code">~code~</code> |

    Scenario: Ignore italic formatting symbol inside
        And I type "`_code_`"
        When I press the "Enter" keyboard button
        Then I should see "_code_" in "Message body"
        And Message has the following HTML content at "last" position in "Message body":
            | html content                               |
            | <code class="c-mrkdwn__code">_code_</code> |

    Scenario: Ignore bold formatting symbol inside
        And I type "`*code*`"
        When I press the "Enter" keyboard button
        Then I should see "*code*" in "Message body"
        And Message has the following HTML content at "last" position in "Message body":
            | html content                               |
            | <code class="c-mrkdwn__code">*code*</code> |

    Scenario: No formatting without end of code block
        And I type "`some code"
        When I press the "Enter" keyboard button
        Then I should see "`some code" in "Message body"
        And Message has the following HTML content at "last" position in "Message body":
            | html content |
            | `some code   |

    Scenario: No formatting without begin of code block
        And I type "some code`"
        When I press the "Enter" keyboard button
        Then I should see "some code`" in "Message body"
        And Message has the following HTML content at "last" position in "Message body":
            | html content |
            | some code`   |

    Scenario: No formatting for empty code block
        And I type "``"
        When I press the "Enter" keyboard button
        Then I should see "``" in "Message body"
        And Message has the following HTML content at "last" position in "Message body":
            | html content |
            | ``           |

    Scenario: No formatting for code block with only spaces in it
        And I type "`      `"
        When I press the "Enter" keyboard button
        Then I should see "` `" in "Message body"
        And Message has the following HTML content at "last" position in "Message body":
            | html content |
            | `&nbsp;<wbr>&nbsp;<wbr>&nbsp;<wbr>&nbsp;<wbr>&nbsp;<wbr>&nbsp;<wbr>` |
    
    Scenario: No formatting if additional apostrophe at the begin
        And I type "``code`"
        When I press the "Enter" keyboard button
        Then I should see "``code`" in "Message body"
        And Message has the following HTML content at "last" position in "Message body":
            | html content |
            | ``code`      |