defmodule ReactWorkshopFeedbackWeb.VolunteerControllerTest do
  use ReactWorkshopFeedbackWeb.ConnCase

  alias ReactWorkshopFeedback.Studentcomment

  @create_attrs %{college_name: "some college_name", name: "some name", phone_number: "some phone_number"}
  @update_attrs %{college_name: "some updated college_name", name: "some updated name", phone_number: "some updated phone_number"}
  @invalid_attrs %{college_name: nil, name: nil, phone_number: nil}

  def fixture(:volunteer) do
    {:ok, volunteer} = Studentcomment.create_volunteer(@create_attrs)
    volunteer
  end

  describe "index" do
    test "lists all volunteers", %{conn: conn} do
      conn = get(conn, Routes.volunteer_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Volunteers"
    end
  end

  describe "new volunteer" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.volunteer_path(conn, :new))
      assert html_response(conn, 200) =~ "New Volunteer"
    end
  end

  describe "create volunteer" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.volunteer_path(conn, :create), volunteer: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.volunteer_path(conn, :show, id)

      conn = get(conn, Routes.volunteer_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Volunteer"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.volunteer_path(conn, :create), volunteer: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Volunteer"
    end
  end

  describe "edit volunteer" do
    setup [:create_volunteer]

    test "renders form for editing chosen volunteer", %{conn: conn, volunteer: volunteer} do
      conn = get(conn, Routes.volunteer_path(conn, :edit, volunteer))
      assert html_response(conn, 200) =~ "Edit Volunteer"
    end
  end

  describe "update volunteer" do
    setup [:create_volunteer]

    test "redirects when data is valid", %{conn: conn, volunteer: volunteer} do
      conn = put(conn, Routes.volunteer_path(conn, :update, volunteer), volunteer: @update_attrs)
      assert redirected_to(conn) == Routes.volunteer_path(conn, :show, volunteer)

      conn = get(conn, Routes.volunteer_path(conn, :show, volunteer))
      assert html_response(conn, 200) =~ "some updated college_name"
    end

    test "renders errors when data is invalid", %{conn: conn, volunteer: volunteer} do
      conn = put(conn, Routes.volunteer_path(conn, :update, volunteer), volunteer: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Volunteer"
    end
  end

  describe "delete volunteer" do
    setup [:create_volunteer]

    test "deletes chosen volunteer", %{conn: conn, volunteer: volunteer} do
      conn = delete(conn, Routes.volunteer_path(conn, :delete, volunteer))
      assert redirected_to(conn) == Routes.volunteer_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.volunteer_path(conn, :show, volunteer))
      end
    end
  end

  defp create_volunteer(_) do
    volunteer = fixture(:volunteer)
    {:ok, volunteer: volunteer}
  end
end
