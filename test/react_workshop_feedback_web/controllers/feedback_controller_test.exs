defmodule ReactWorkshopFeedbackWeb.FeedbackControllerTest do
  use ReactWorkshopFeedbackWeb.ConnCase

  alias ReactWorkshopFeedback.Studentcomment

  @create_attrs %{food_feedback: "some food_feedback", improvement: "some improvement", next_session: "some next_session", session1_feedback: "some session1_feedback", session2_feedback: "some session2_feedback"}
  @update_attrs %{food_feedback: "some updated food_feedback", improvement: "some updated improvement", next_session: "some updated next_session", session1_feedback: "some updated session1_feedback", session2_feedback: "some updated session2_feedback"}
  @invalid_attrs %{food_feedback: nil, improvement: nil, next_session: nil, session1_feedback: nil, session2_feedback: nil}

  def fixture(:feedback) do
    {:ok, feedback} = Studentcomment.create_feedback(@create_attrs)
    feedback
  end

  describe "index" do
    test "lists all feedbacks", %{conn: conn} do
      conn = get(conn, Routes.feedback_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Feedbacks"
    end
  end

  describe "new feedback" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.feedback_path(conn, :new))
      assert html_response(conn, 200) =~ "New Feedback"
    end
  end

  describe "create feedback" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.feedback_path(conn, :create), feedback: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.feedback_path(conn, :show, id)

      conn = get(conn, Routes.feedback_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Feedback"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.feedback_path(conn, :create), feedback: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Feedback"
    end
  end

  describe "edit feedback" do
    setup [:create_feedback]

    test "renders form for editing chosen feedback", %{conn: conn, feedback: feedback} do
      conn = get(conn, Routes.feedback_path(conn, :edit, feedback))
      assert html_response(conn, 200) =~ "Edit Feedback"
    end
  end

  describe "update feedback" do
    setup [:create_feedback]

    test "redirects when data is valid", %{conn: conn, feedback: feedback} do
      conn = put(conn, Routes.feedback_path(conn, :update, feedback), feedback: @update_attrs)
      assert redirected_to(conn) == Routes.feedback_path(conn, :show, feedback)

      conn = get(conn, Routes.feedback_path(conn, :show, feedback))
      assert html_response(conn, 200) =~ "some updated food_feedback"
    end

    test "renders errors when data is invalid", %{conn: conn, feedback: feedback} do
      conn = put(conn, Routes.feedback_path(conn, :update, feedback), feedback: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Feedback"
    end
  end

  describe "delete feedback" do
    setup [:create_feedback]

    test "deletes chosen feedback", %{conn: conn, feedback: feedback} do
      conn = delete(conn, Routes.feedback_path(conn, :delete, feedback))
      assert redirected_to(conn) == Routes.feedback_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.feedback_path(conn, :show, feedback))
      end
    end
  end

  defp create_feedback(_) do
    feedback = fixture(:feedback)
    {:ok, feedback: feedback}
  end
end
