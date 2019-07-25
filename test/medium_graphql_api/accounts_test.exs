defmodule MediumGraphqlApi.AccountsTest do
  use MediumGraphqlApi.DataCase

  alias MediumGraphqlApi.Accounts

  describe "users" do
    alias MediumGraphqlApi.Accounts.User

    @valid_attrs %{attempts: "some attempts", confirmed: "some confirmed", email: "some email", locked: "some locked", password_hash: "some password_hash", username: "some username"}
    @update_attrs %{attempts: "some updated attempts", confirmed: "some updated confirmed", email: "some updated email", locked: "some updated locked", password_hash: "some updated password_hash", username: "some updated username"}
    @invalid_attrs %{attempts: nil, confirmed: nil, email: nil, locked: nil, password_hash: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.attempts == "some attempts"
      assert user.confirmed == "some confirmed"
      assert user.email == "some email"
      assert user.locked == "some locked"
      assert user.password_hash == "some password_hash"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.attempts == "some updated attempts"
      assert user.confirmed == "some updated confirmed"
      assert user.email == "some updated email"
      assert user.locked == "some updated locked"
      assert user.password_hash == "some updated password_hash"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "users" do
    alias MediumGraphqlApi.Accounts.User

    @valid_attrs %{attempts: "some attempts", confirmed: "some confirmed", email: "some email", locked: "some locked", password: "some password", role: "some role", username: "some username"}
    @update_attrs %{attempts: "some updated attempts", confirmed: "some updated confirmed", email: "some updated email", locked: "some updated locked", password: "some updated password", role: "some updated role", username: "some updated username"}
    @invalid_attrs %{attempts: nil, confirmed: nil, email: nil, locked: nil, password: nil, role: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.attempts == "some attempts"
      assert user.confirmed == "some confirmed"
      assert user.email == "some email"
      assert user.locked == "some locked"
      assert user.password == "some password"
      assert user.role == "some role"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.attempts == "some updated attempts"
      assert user.confirmed == "some updated confirmed"
      assert user.email == "some updated email"
      assert user.locked == "some updated locked"
      assert user.password == "some updated password"
      assert user.role == "some updated role"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
