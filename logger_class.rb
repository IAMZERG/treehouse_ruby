require "logger"

logger = Logger.new(STDOUT)

logger.info "This is an info message"
logger.debug "This is a debugging message"

logger.warn "Warning message"
logger.error "This is an error."

log = Logger.new("log.txt")

log.info "This is a new message."
log.error "This is an error"
log.warn "Be careful!"


