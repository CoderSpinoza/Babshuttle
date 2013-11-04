#!/bin/env ruby
# encoding: utf-8

FactoryGirl.define do
	factory :order do
		items "신라면 20개입, 짜파게티 16개입"
		phone_number "510-542-1892"
		association :user
	end
end