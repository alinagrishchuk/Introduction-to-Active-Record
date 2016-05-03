# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

todo_lists = [
    {list_name: 'walk', list_due_date: Date.today + 1.year},
    {list_name: 'learn to sing', list_due_date: Date.today + 1.year},
    {list_name: 'travel to', list_due_date: Date.today + 1.year},
    {list_name: 'learn to dance', list_due_date: Date.today + 1.year},
    ]


todo_items = [
          [
            {title: 'Walk', due_date: Date.today + 1.year, description: 'some description'},
            {title: 'More walk', due_date: Date.today + 1.year, description: 'some description'},
            {title: 'Relax', due_date: Date.today + 1.year, description: 'some description'},
            {title: 'Run', due_date: Date.today + 1.year, description: 'some description'},
            {title: 'Chill', due_date: Date.today + 1.year, description: 'some description'}
          ],
          [
              {title: 'Pop', due_date: Date.today + 1.year, description: 'some description'},
              {title: 'Country', due_date: Date.today + 1.year, description: 'some description'},
              {title: 'Ballads', due_date: Date.today + 1.year, description: 'some description'},
              {title: 'Gospel', due_date: Date.today + 1.year, description: 'some description'},
              {title: 'Classical', due_date: Date.today + 1.year, description: 'some description'}
          ],
          [
              {title: 'New York', due_date: Date.today + 1.year, description: 'some description'},
              {title: 'Rome', due_date: Date.today + 1.year, description: 'some description'},
              {title: 'GOA', due_date: Date.today + 1.year, description: 'some description'},
              {title: 'London', due_date: Date.today + 1.year, description: 'some description'},
              {title: 'Kiev', due_date: Date.today + 1.year, description: 'some description'  }
          ],
          [
              {title: 'Bachata', due_date: Date.today + 1.year, description: 'some description'},
              {title: 'Charleston', due_date: Date.today + 1.year, description: 'some description'},
              {title: 'Flamenco', due_date: Date.today + 1.year, description: 'some description'},
              {title: 'Minuet', due_date: Date.today + 1.year, description: 'some description'},
              {title: 'Peabody', due_date: Date.today + 1.year, description: 'some description'}
          ]
        ]


User.delete_all
TodoList.delete_all
TodoItem.delete_all
Profile.delete_all

(User.create! username: 'Fiorina', password_digest: 'fiorina1954' ).
    create_profile! gender: 'female', first_name:'Carly',
                  last_name: 'Fiorina', birth_year:  1954

(User.create! username: 'Trump', password_digest: 'trump1946').
    create_profile! gender: 'male', first_name: 'Donald',
                  last_name: 'Trump', birth_year: 1946

(User.create! username: 'Carson', password_digest: 'carson1951').
    create_profile! gender: 'male', first_name: 'Ben',
                  last_name: 'Carson', birth_year: 1951

(User.create! username: 'Clinton', password_digest: 'clinton1947').
    create_profile! gender: 'female', first_name: 'Hillary',
                  last_name: 'Clinton', birth_year:  1947


User.find_each do |user|
  list_pointer = rand(0...todo_lists.length)
  ( user.todo_lists.create! ( [] << todo_lists[list_pointer] ) )
      .first
      .todo_items.create! todo_items[list_pointer]
  todo_lists.delete_at(list_pointer)
end