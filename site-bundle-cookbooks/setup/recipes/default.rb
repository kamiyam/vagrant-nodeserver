#
# Cookbook Name:: setup
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user_ids = data_bag('users')
user_ids.each do |id|
  u = data_bag_item('users', id)
  user u['id'] do
    username  u['username']
    home      "/home/#{id}"
    shell     u['shell']
    password  u['password']
    supports  :manage_home => true, :non_unique => false
    action    [:remove, :create]
  end
end

group_ids = data_bag('group')
group_ids.each do |id|
  g = data_bag_item('group', id)
  group g['id'] do
    group_name g['group_name']
    members    g['members']
    action     [:create, :modify]
  end
end

# Install the unzip package
package "unzip" do
  action :install
end