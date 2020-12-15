import os
import sys

import discord
from discord import TextChannel

TOKEN = os.getenv('DISCORD_TOKEN')

message = sys.argv[1]

client = discord.Client()


@client.event
async def on_ready():
    channel: TextChannel
    channel = client.get_channel(754320141436715008)  # pm-ws2021
    await channel.send(message)
    await client.close()


client.run(TOKEN)
