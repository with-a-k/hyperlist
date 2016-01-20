require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    george = User.new(name: "George Weasley", email: "twins@www.magic", password: "mischiefmanager", password_confirmation: "mischiefmanager")
    assert george.valid?
  end

  test "still valid with no name" do
    horse = User.new(email: "nameless@america.com", password: "throughthedesert", password_confirmation: "throughthedesert")
    assert horse.valid?
  end

  test "not valid with no email" do
    dresden = User.new(name: "Harry Dresden", password: "citywind", password_confirmation: "citywind")
    refute dresden.valid?
  end

  test "not valid with no password" do
    renne = User.new(name: "Renne Hayworth", email: "enforcerxv@ourobor.us", password_confirmation: "xoutxbell")
    refute renne.valid?
  end

  test "not valid with no password confirmation" do
    tiz = User.new(name: "Tiz Arrior", email: "justafarmer@norende.net", password: "celestialsurvivor")
    refute tiz.valid?
  end

  test "not valid with the same email as another user" do
    User.create(name: "Gaius", email: "gaius@rpgsr.us", password: "stealingcandy", password_confirmation: "stealingcandy")
    gaius = User.new(name: "Gaius", email: "gaius@rpgsr.us", password: "aujouler", password_confirmation: "aujouler")
    refute gaius.valid?
  end
end
