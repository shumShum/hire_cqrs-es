defmodule Hire.Utils do
  def generate_id do
    String.to_integer("#{:os.system_time(:millisecond)}#{:rand.uniform(1000)}")
  end
end
