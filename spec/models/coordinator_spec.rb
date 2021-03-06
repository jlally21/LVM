require 'rails_helper'

RSpec.describe Coordinator, type: :model do
  describe 'associations' do
    it 'should have many enrollments' do
      should have_many(:enrollments)
    end

    it 'students through enrollments' do
      should have_many(:students).through(:enrollments)
    end

    it 'should have many volunteer_jobs' do
      should have_many(:volunteer_jobs)
    end

    it 'tutors through volunteer_jobs' do
      should have_many(:tutors).through(:volunteer_jobs)
    end
  end

  describe 'validations' do
    describe 'name' do
      it 'validates presence' do
        should validate_presence_of(:name)
      end

      it 'validates length' do
        should validate_length_of(:name)
          .is_at_most(50)
      end
    end

    describe 'email' do
      it 'validates presence' do
        should validate_presence_of(:email)
      end

      it 'validates length' do
        should validate_length_of(:email)
          .is_at_most(255)
      end

      it 'validates format' do
        should allow_value('email@address.foo').for(:email)
        should_not allow_value('foo').for(:email)
        should_not allow_value('foo@').for(:email)
        should_not allow_value('foo@address').for(:email)
        should_not allow_value('address.foo').for(:email)
      end

      it 'validates uniqueness' do
        should validate_uniqueness_of(:email).case_insensitive
      end
    end
  end
end
