import consumer from "./consumer";

document.addEventListener("turbolinks:load", () => {
	const messagesContainer = document.querySelector(".messages");
	if (messagesContainer) {
		const id = messagesContainer.dataset.chatroomId;

		consumer.subscriptions.create(
			{ channel: "ChatRoomsChannel", id: id },
			{
				received(data) {
					messagesContainer.insertAdjacentHTML("beforeend", data);
				},
			}
		);
	}
});
