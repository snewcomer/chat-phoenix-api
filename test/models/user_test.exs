defmodule Peepchat.UserTest do
  use Peepchat.ModelCase

  alias Peepchat.User

  @valid_attrs %{email: "snewco@gmail.com", password: "abc123456", password_confirmation: "abc123456"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "short password doesnt work" do
    changeset = User.changeset(%User{}, %{email: "snewco@gmail.com", password: "wat", password_confirmation: "wat"})
    refute changeset.valid?
  end
end
