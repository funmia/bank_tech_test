![Build Status](https://travis-ci.org/funmia/bank_tech_test.svg?branch=master)

# Bank tech test

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## My Solution

## Tech
- Ruby
- [Rspec](http://rspec.info/documentation/)
- [travis-ci](https://travis-ci.org/)
- [simplecov](https://github.com/colszowka/simplecov)


# Set up

#### Clone the repo

```
$ git@github.com:funmia/bank_tech_test.git
```

#### Install dependencies
```
$ gem install bundler
$ bundle
```
#### Run the tests
```
$ rspec
```
![Imgur](https://i.imgur.com/Sauti18.png)

#### Run the app
```
$ irb
$ require "./lib/bank_account"
$ bank_account = BankAccount.new
$ bank_account.make_deposit(10.00)
$ bank_account.make_withdrawal(5.00)
$ bank_account.print_statement
```
#### Terminal example
![Screenshot](https://i.imgur.com/rdLhDOk.png)

#### My Approach
- The app has four classes BankAccount, Debit, Credit and Printer
- I started with a domain domain model of the BankAccount class

| Object | Messages|
| -- | -- |
| BankAccount | makes_withdrawal |
|   | make_deposit|
| | transactions|
| | print_statement|

-  Each class was created in Test driven way and my test coverage is currently 98.21%

- I decided to make a separate object for each type of transaction which are the Debit and Credit objects.

- I stored each transaction in an array of transactions in the BankAccount object. Each transaction is a hash with the transaction object and the balance at that point.

- The make_deposit method increases the bank account balance and then instantiates a Credit object which gets stored in the transactions array.

- The make_withdrawal method reduces the bank account balance and then instantiates a Debit object which gets stored in the transactions array.

- I have created the Printer object which has a method that  makes a formatted table from the array of transactions.

- And the BankAccount object uses print_statement method to print the stored transactions.
