## Module 1 Assessment Starter Kit

Before your assessment, you should clone this repository, `bundle`, and make sure all the tests pass by running `rake`.

Then, spend a few minutes to familiarize yourself with the structure and contents of the project. So far it contains a single Ruby class, `Item`, and some accompanying tests.

#### Running Tests

From the project's root, `rake` like a boss.

#### Installing Dependencies

You will probably have the gems needed for this project already on your machine, but if not, `bundle`.



Shop Keepers International

Inventory
Create the following functionality to perform inventories: An inventory should record the date of the inventory as noted by the person taking the inventory and record all the items in the store. Track items' names, with each item's quantity and cost Expect items to be tracked something like this {"shoes" => {"quantity" => 75, "cost" => $100}}

Stock the Store
Tie your Store and Inventory together. Create the functionality to check if something is in stock as well as to restock an item.

How much sold?
For any given store provide the functionality to determine how much you've sold overall.
Track the change of amount for each item from the most recent inventory date to next most recent date.

International Sales  
When someone from Rio orders something from your store, you'll need to calculate total cost in the new currency. The exchange rate from US Dollars to Brazilian real is $1 == R$3.08. Create the functionality to determine how much an order would cost in Brazilian Real. Expect an order to look something like this: {"shoes" => 3, "dress" => 1}.
