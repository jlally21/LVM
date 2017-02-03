require 'rails_helper'

RSpec.describe Tutor, type: :model do
  describe 'associations' do
    it 'should have many matches' do
      should have_many(:matches)
    end

    it 'students through matches' do
      should have_many(:students).through(:matches)
    end

    it 'should have many volunteer_jobs' do
      should have_many(:volunteer_jobs)
    end

    it 'coordinators through volunteer_jobs' do
      should have_many(:coordinators).through(:volunteer_jobs)
    end
  end

  describe 'validations' do
    describe 'fields' do
      it 'validates presence' do
        should validate_presence_of(:affiliate)
        should validate_presence_of(:address)
        should validate_presence_of(:city)
        should validate_presence_of(:state)
        should validate_presence_of(:zip)
        should validate_presence_of(:cell_phone)
        should validate_presence_of(:gender)
        should validate_presence_of(:native_language)
        should validate_presence_of(:race)
        should validate_presence_of(:training_type)
        should validate_presence_of(:referral)
        should validate_presence_of(:education)
        should validate_presence_of(:employment)
        should validate_presence_of(:occupation)
        should validate_presence_of(:orientation)
        should validate_presence_of(:training)
        should validate_presence_of(:dob)
      end
    end

    describe 'name' do
      it 'validates presence' do
        should validate_presence_of(:first_name)
        should validate_presence_of(:last_name)
      end

      it 'validates length' do
        should validate_length_of(:first_name)
          .is_at_most(25)
        should validate_length_of(:last_name)
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
