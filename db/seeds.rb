# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# encoding: utf-8
Status.create(
    [
        {status_name: 'Waiting for Staff Response'},
        {status_name: 'Waiting for Customer'},
        {status_name: 'On Hold'},
        {status_name: 'Cancelled'},
        {status_name: 'Completed'}
    ])

Department.create(
    [
        {department_name: 'Security department'},
        {department_name: 'IT department'},
        {department_name: 'Support department'}
    ])

