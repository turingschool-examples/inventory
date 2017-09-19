## Module 1 Assessment Starter Kit

Before your assessment, you should clone this repository, `bundle`, and make sure all the tests pass by running `rake`.

Then, spend a few minutes to familiarize yourself with the structure and contents of the project. So far it contains a single Ruby class, `Item`, and some accompanying tests.

#### Running Tests

From the project's root, `rake` like a boss.

#### Installing Dependencies

You will probably have the gems needed for this project already on your machine, but if not, `bundle`.


Shop Keepers International

Iteration 1: Inventory

Create the following functionality to perform inventories. An inventory should record the date and record all the items in the store at that time. Track items' names, with each item's quantity and cost. Expect items to be tracked something like this {"shoes" => {"quantity" => 75, "cost" => 100}}

inventory1 = Inventory.new(Date.new(2017, 9, 18))
=> <Inventory...>

inventory1.date
=> #<Date: 2017-09-18 ((2458015j,0s,0n),+0s,2299161j)>

inventory1.items
=> {}

inventory1.record_item({"shirt" => {"quantity" => 50, "cost" => 15}})
inventory1.items
=> {"shirt" => {"quantity" => 50, "cost" => 15}}

inventory1.record_item({"shirt" => {"quantity" => 10, "cost" => 15}})
inventory1.items
=> {"shirt" => {"quantity" => 60, "cost" => 15}}
Iteration 2: Check the Stock

Tie your Store and Inventory together. Create the functionality to check if something is in stock.

inventory2 = Inventory.new(Date.new(2017, 9, 18))
inventory2.record_item({"shoes" => {"quantity" => 40, "cost" => 30}})

acme = Store.new("Acme", "324 Main St", "Grocery")
acme.inventory_record
=> []

acme.add_inventory(inventory1)
acme.add_inventory(inventory2)

acme.inventory_record
=> [<Inventory...>, <Inventory...>]

acme.stock_check("shirt")
=> {"quantity" => 60, "cost" => 15}
Iteration 3: How much sold?

For any given store provide the functionality to determine how much you've sold recently. Track the change of amount for each item from the most recent inventory date to next most recent date.

ace = Store.new("Ace", "834 2nd St", "Hardware")

inventory3 = Inventory.new(Date.new(2017, 9, 16))
inventory3.record_item({"hammer" => {"quantity" => 20, "cost" => 20}})

inventory4 = Inventory.new(Date.new(2017, 9, 18))
inventory4.record_item({"mitre saw" => {"quantity" => 10, "cost" => 409}})
inventory4.record_item({"hammer" => {"quantity" => 15, "cost" => 20}})

ace.add_inventory(inventory3)
ace.add_inventory(inventory4)

ace.amount_sold("hammer")
=> 5
Iteration 4: International Sales

When someone from Rio orders something from your store, you'll need to calculate total cost in the new currency. The exchange rate from US Dollars to Brazilian Real is $1 == R$3.08. Create the functionality to determine how much an order would cost in Brazilian Real. Expect an order to look something like this: {"shoes" => 3, "dress" => 1}.

hobby_town = Store.new("Hobby Town", "894 Bee St", "Hobby")
inventory5 = Inventory.new(Date.new(2017, 3, 10))
inventory5.record_item({"miniature orc" => {"quantity" => 2000, "cost" => 20}})
inventory5.record_item({"fancy paint brush" => {"quantity" => 200, "cost" => 20}})


ace.us_order({"miniature orc" => 30, "fancy paint brush" => 1})
=> $620

ace.brazilian_order({"miniature orc" => 30, "fancy paint brush" => 1})
=> R$1909.60
Rubric

Ruby Syntax & Style

4: Application demonstrates excellent knowledge of Ruby syntax, style, and refactoring
3: Application shows strong effort towards organization, content, and refactoring
2: Application runs but the code has long methods, unnecessary or poorly named variables, and needs significant refactoring
1: Application generates syntax error or crashes during execution
Breaking Logic into Components

4: Application is expertly divided into logical components each with a clear, single responsibility
3: Application effectively breaks logical components apart but breaks the principle of SRP
2: Application shows some effort to break logic into components, but the divisions are inconsistent or unclear
1: Application logic shows poor decomposition with too much logic mashed together
Test-Driven Development

4: Application is broken into components which are well tested in both isolation and integration using appropriate data
3: Application is well tested but does not balance isolation and integration tests, using only the data necessary to test the functionality
2: Application makes some use of tests, but the coverage is insufficient
1: Application does not demonstrate strong use of TDD
Functional Expectations

4: Developer completes functionality through iteration 4
3: Developer completes functionality through iteration 3
2: Developer completes functionality through iteration 2
1: Developer wrote functionality but does not complete through iteration 2
Version Control

4: Student demonstrates strong git workflow, commits frequently to document progress, uses commits to identify added functionality, and utilizes pull requests for communication and feedback
3: Student utilizes git workflow essentials, committing frequently to document progress
2: Student adds and commits infrequently and pushes project to GitHub
1: Student makes an initial commit and pushes project to GitHub
