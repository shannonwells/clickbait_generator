require "rails_helper"

describe 'inflections' do
  include ActiveSupport::Inflector
  it "pluralizing should DTRT" do
    expect("Passer By".pluralize).to eql "Passers By"
    expect("Little Girl".pluralize).to eql "Little Girls"
    expect("White Person".pluralize).to eql "White People"
    expect("Puppy".pluralize).to eql "Puppies"
  end

  it 'verbs should DTRT' do
    expect("Be Near".downcase.verb.conjugate(:subject => "Girl").titleize).to eql "Girl Is Near"

    expect("Be Rescued From".verb.conjugate(subject: "Girl")).to eql "Girl Is Rescued From"
    expect("Be Rescued From".verb.conjugate(subject: 'You')).to eql "You Are Rescued From"
  end
end