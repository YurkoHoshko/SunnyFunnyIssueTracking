# -*- encoding : utf-8 -*-
class Query < ActiveRecord::Base

   include ActiveModel::Dirty
  attr_accessible :customer_email, :customer_name, :department_id, :description, :status_id, :subject, :user_id, :uid, :replies_attributes

  belongs_to :status
  belongs_to :department
  belongs_to :user
  has_many :replies
  has_many :changes
  accepts_nested_attributes_for :replies

  searchable do
    text :subject, :description
  end

  validates_presence_of :customer_email, :customer_name, :description, :subject
  validates_format_of :customer_name, :with => /^[a-zA-Zа-яА-Я \-\_]+$/, :allow_blank => true
  validates_format_of :customer_email, :with => /^[-\w.]+@([A-z0-9][-A-z0-9]+\.)+[A-z]{2,4}$/, :allow_blank=>true

  def self.unassigned
    self.where("user_id like ?", "0")
  end

  def self.open(id)
    status1=Status.where("status_name like ?", "Waiting for Customer")
    status2=Status.where("status_name like ?", "Waiting for Staff Response")

    self.where("user_id = ? and status_id like ? or status_id like ?", "#{id}","#{status1.first.id}","#{status2.first.id}")
  end

  def self.on_hold(id)
    status=Status.where("status_name like ?", "On hold")
    self.where("user_id = ? and  status_id like ?", "#{id}", "#{status.first.id}")
  end

  def self.closed(id)
    status1=Status.where("status_name like ?", "Completed")
    status2=Status.where("status_name like ?", "Cancelled")
    self.where("user_id = ? and  status_id like ? or status_id like ?", "#{id}", "#{status1.first.id}","#{status2.first.id}")
  end

  def self.uid_search(search)
    self.where("uid = ?", "#{search}").first
  end


  def self.subject_search(search,user_id)
    unless search.blank?
    @result=self.find(:all, :conditions=>["subject like ? and user_id = ?", "%#{search}%","#{user_id}"])
  end
end

  def self.description_search(search,user_id)
    unless search.blank?
    @result=self.find(:all, :conditions=>["description like ? and user_id = ?", "%#{search}%", "#{user_id}"])
    end
  end

end
