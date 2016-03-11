defmodule NoreplyTest.BadServer do
  use GenServer

  def start_link(state, opts \\ []) do
    GenServer.start_link(__MODULE__, state, opts)
  end

  def init(state) do
    {:ok, state}
  end

  def boom!(pid) do
    GenServer.cast(pid, :boom)
  end

  def handle_cast(:boom, state) do
    {:noreply, state, :oops_this_shouldnt_be_here_or_should_at_least_be_an_integer}
  end

end
