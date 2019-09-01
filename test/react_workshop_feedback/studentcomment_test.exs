defmodule ReactWorkshopFeedback.StudentcommentTest do
  use ReactWorkshopFeedback.DataCase

  alias ReactWorkshopFeedback.Studentcomment

  describe "feedbacks" do
    alias ReactWorkshopFeedback.Studentcomment.Feedback

    @valid_attrs %{food_feedback: "some food_feedback", improvement: "some improvement", next_session: "some next_session", session1_feedback: "some session1_feedback", session2_feedback: "some session2_feedback"}
    @update_attrs %{food_feedback: "some updated food_feedback", improvement: "some updated improvement", next_session: "some updated next_session", session1_feedback: "some updated session1_feedback", session2_feedback: "some updated session2_feedback"}
    @invalid_attrs %{food_feedback: nil, improvement: nil, next_session: nil, session1_feedback: nil, session2_feedback: nil}

    def feedback_fixture(attrs \\ %{}) do
      {:ok, feedback} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Studentcomment.create_feedback()

      feedback
    end

    test "list_feedbacks/0 returns all feedbacks" do
      feedback = feedback_fixture()
      assert Studentcomment.list_feedbacks() == [feedback]
    end

    test "get_feedback!/1 returns the feedback with given id" do
      feedback = feedback_fixture()
      assert Studentcomment.get_feedback!(feedback.id) == feedback
    end

    test "create_feedback/1 with valid data creates a feedback" do
      assert {:ok, %Feedback{} = feedback} = Studentcomment.create_feedback(@valid_attrs)
      assert feedback.food_feedback == "some food_feedback"
      assert feedback.improvement == "some improvement"
      assert feedback.next_session == "some next_session"
      assert feedback.session1_feedback == "some session1_feedback"
      assert feedback.session2_feedback == "some session2_feedback"
    end

    test "create_feedback/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Studentcomment.create_feedback(@invalid_attrs)
    end

    test "update_feedback/2 with valid data updates the feedback" do
      feedback = feedback_fixture()
      assert {:ok, %Feedback{} = feedback} = Studentcomment.update_feedback(feedback, @update_attrs)
      assert feedback.food_feedback == "some updated food_feedback"
      assert feedback.improvement == "some updated improvement"
      assert feedback.next_session == "some updated next_session"
      assert feedback.session1_feedback == "some updated session1_feedback"
      assert feedback.session2_feedback == "some updated session2_feedback"
    end

    test "update_feedback/2 with invalid data returns error changeset" do
      feedback = feedback_fixture()
      assert {:error, %Ecto.Changeset{}} = Studentcomment.update_feedback(feedback, @invalid_attrs)
      assert feedback == Studentcomment.get_feedback!(feedback.id)
    end

    test "delete_feedback/1 deletes the feedback" do
      feedback = feedback_fixture()
      assert {:ok, %Feedback{}} = Studentcomment.delete_feedback(feedback)
      assert_raise Ecto.NoResultsError, fn -> Studentcomment.get_feedback!(feedback.id) end
    end

    test "change_feedback/1 returns a feedback changeset" do
      feedback = feedback_fixture()
      assert %Ecto.Changeset{} = Studentcomment.change_feedback(feedback)
    end
  end

  describe "volunteers" do
    alias ReactWorkshopFeedback.Studentcomment.Volunteer

    @valid_attrs %{college_name: "some college_name", name: "some name", phone_number: "some phone_number"}
    @update_attrs %{college_name: "some updated college_name", name: "some updated name", phone_number: "some updated phone_number"}
    @invalid_attrs %{college_name: nil, name: nil, phone_number: nil}

    def volunteer_fixture(attrs \\ %{}) do
      {:ok, volunteer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Studentcomment.create_volunteer()

      volunteer
    end

    test "list_volunteers/0 returns all volunteers" do
      volunteer = volunteer_fixture()
      assert Studentcomment.list_volunteers() == [volunteer]
    end

    test "get_volunteer!/1 returns the volunteer with given id" do
      volunteer = volunteer_fixture()
      assert Studentcomment.get_volunteer!(volunteer.id) == volunteer
    end

    test "create_volunteer/1 with valid data creates a volunteer" do
      assert {:ok, %Volunteer{} = volunteer} = Studentcomment.create_volunteer(@valid_attrs)
      assert volunteer.college_name == "some college_name"
      assert volunteer.name == "some name"
      assert volunteer.phone_number == "some phone_number"
    end

    test "create_volunteer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Studentcomment.create_volunteer(@invalid_attrs)
    end

    test "update_volunteer/2 with valid data updates the volunteer" do
      volunteer = volunteer_fixture()
      assert {:ok, %Volunteer{} = volunteer} = Studentcomment.update_volunteer(volunteer, @update_attrs)
      assert volunteer.college_name == "some updated college_name"
      assert volunteer.name == "some updated name"
      assert volunteer.phone_number == "some updated phone_number"
    end

    test "update_volunteer/2 with invalid data returns error changeset" do
      volunteer = volunteer_fixture()
      assert {:error, %Ecto.Changeset{}} = Studentcomment.update_volunteer(volunteer, @invalid_attrs)
      assert volunteer == Studentcomment.get_volunteer!(volunteer.id)
    end

    test "delete_volunteer/1 deletes the volunteer" do
      volunteer = volunteer_fixture()
      assert {:ok, %Volunteer{}} = Studentcomment.delete_volunteer(volunteer)
      assert_raise Ecto.NoResultsError, fn -> Studentcomment.get_volunteer!(volunteer.id) end
    end

    test "change_volunteer/1 returns a volunteer changeset" do
      volunteer = volunteer_fixture()
      assert %Ecto.Changeset{} = Studentcomment.change_volunteer(volunteer)
    end
  end
end
