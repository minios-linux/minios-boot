# Variables
SBIN = $(shell find sbin -type f)
SYSTEMD = $(shell find systemd -type f)

SBINDIR = usr/sbin
SYSTEMDDIR = usr/lib/systemd/system

DOC_FILES = $(shell find doc -name "*.md")
MAN_FILES = $(patsubst doc/%.md, man/%.1, $(DOC_FILES))

# Build rules
ifeq (,$(findstring nodoc,$(DEB_BUILD_PROFILES)))
ifeq (,$(findstring nodoc,$(DEB_BUILD_OPTIONS)))
build: man
endif
endif

# Compilation rules
man: $(MAN_FILES)

man/%.1: doc/%.md
	@echo "Generating man file for $<"
	mkdir -p $(@D)
	pandoc -s -t man $< -o $@

# Clean rule
clean:
	rm -rf man

# Install rule
install: build
	install -d $(DESTDIR)/$(SBINDIR)
	install -m755 $(SBIN) $(DESTDIR)/$(SBINDIR)

	install -d $(DESTDIR)/$(SYSTEMDDIR)
	install -m644 $(SYSTEMD) $(DESTDIR)/$(SYSTEMDDIR)
