# Log File Cleanup Script

## Description

Automatically clean `quick-start-combined.log` log files in your system with Telegram notifications and disk space reporting. More details can be found at <https://github.com/gthrm/clear_logs>.

## Usage

### Setup

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/gthrm/clear_logs
   cd clear_logs
   ```

2. **Setting Up .env File:**
   Create a `.env` file in your home directory with the following variables:

   ```
   LOG_DIR=/path/to/log/directory
   LOG_NAME=quick-start-combined.log
   TELEGRAM_TOKEN=your_telegram_bot_token
   TELEGRAM_CHAT_ID=your_chat_id
   ```

3. **Make Script Executable:**

   ```bash
   chmod +x clear_logs.sh
   ```

### Running the Script

You can run the script directly:

```bash
./clear_logs.sh
```

### Setting Up a Cron Job

To automate the log file cleanup, you can set up a cron job:

1. Open your crontab:

   ```bash
   crontab -e
   ```

2. Add the following line to run the script every three months:

   ```bash
   0 0 1 */3* /path/to/clear_logs.sh
   ```

## Dependencies

- `curl` for sending notifications to Telegram.
- `bash` for executing the script.
- `cron` for task automation.

## License

MIT
