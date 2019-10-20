def pet_shop_name(pet_shop)
   return pet_shop[:name]
end

def total_cash(pet_shop)
   return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,amount)
   pet_shop[:admin][:total_cash]+= amount || pet_shop[:admin][:total_cash]-= amount
   return pet_shop[:admin][:total_cash]
end

def pets_sold(pet_shop)
    pets_sold = pet_shop[:admin][:pets_sold]
   return pets_sold
end

def increase_pets_sold(pet_shop,        increase_pets_number)
  pet_shop[:admin][:pets_sold] += increase_pets_number
  return pet_shop[:admin][:pets_sold]
end

def stock_count(pet_shop)
  return pet_shop[:pets].count
end

def pets_by_breed(pet_shop, pets_breed_name)
  pets = []
  # why create an empty []
  # TypeError: no implicit conversion of Symbol into Integer
  for pet in pet_shop[:pets]
    if pet[:breed] == pets_breed_name
     pets.push(pet[:breed])
    end
  end
  return pets
end

# undefined method `[]' for nil:NilClass
# why put 'else' after the if won't work

def find_pet_by_name(pet_shop, pets_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pets_name
      return pet
    # else
    #   return nil
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop,pets_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pets_name
     pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customer)
  customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash]-= amount
end

def customer_pet_count(customer)
   customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer,new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)

  if pet_shop[:pets].include?(pet) == true && customer[:cash] >= pet[:price]

     customer[:pets].push(pet)

     pet_shop[:admin][:pets_sold] += customer[:pets].count

     customer[:cash]-= pet[:price]
     pet_shop[:admin][:total_cash]+= pet[:price]

     return customer[:pets].count, pet_shop[:admin][:pets_sold],customer[:cash], pet_shop[:admin][:total_cash]

  else
    return customer[:pets].count, pet_shop[:admin][:pets_sold],customer[:cash], pet_shop[:admin][:total_cash]

  end
  #
  # # it doesn't work if i write two seperate if statements
  #   if customer[:cash] >= pet[:price]
  #
  #    customer[:cash]-= pet[:price]
  #    pet_shop[:admin][:total_cash]+= pet[:price]
  #
  #    return customer[:cash], pet_shop[:admin][:total_cash]

  # #end
  # end

end
