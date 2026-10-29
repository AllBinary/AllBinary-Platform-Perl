#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::logic::communication::smtp::Email;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::smtp::EmailInterface';

our $DEBUG = "mail.debug";
our $SMTP_HOST = "mail.smtp.host";
our $SMTP_PORT = "mail.smtp.port";
our $SMTP_USER = "mail.smtp.user";
our $SMTP_RETURN_ADDRESS = "mail.from";
our $SMTP_LOCAL_HOST = "mail.smtp.localhost";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{msg} = undef;
    $self->{properties} = undef;
    $self->{bs} = undef;
    $self->{isDebug} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new7(@arguments) if scalar(@arguments) == 7;
    return $class->_new8(@arguments) if scalar(@arguments) == 8;
    die "No constructor of Email takes " . scalar(@arguments) . " arguments";
}


sub _new7 {
    my ($class, $from, $to, $subject, $server, $textBody, $htmlAttachment, $contentBase) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{isDebug} = 0;
        $self->init($from, $to, $subject, $server, $textBody, $htmlAttachment, $contentBase);
    return $self;
}


sub _new8 {
    my ($class, $from, $to, $subject, $server, $textBody, $htmlAttachment, $contentBase, $isDebug) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{isDebug} = $isDebug;
        $self->init($from, $to, $subject, $server, $textBody, $htmlAttachment, $contentBase);
    return $self;
}


# throws Exception
sub init {
    my ($self, $from, $to, $subject, $server, $textBody, $htmlAttachment, $contentBase) = @_;
        try {
            my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
            my $mimeBodyParts = [(undef) x ((!$stringValidationUtil->isEmpty($htmlAttachment) ? 2 : 1))];
            $mimeBodyParts->[0] = 'javax::mail::internet::MimeBodyPart'->new();
            $mimeBodyParts->[0]->setText($textBody);
            if (!$stringValidationUtil->isEmpty($htmlAttachment)) {
                my $internetHeaders = 'javax::mail::internet::InternetHeaders'->new();
                $internetHeaders->addHeader("Content-Type", "text/html");
                if (!$stringValidationUtil->isEmpty($contentBase)) {
                    $internetHeaders->addHeader("Content-Base", $contentBase);
                }
                $mimeBodyParts->[1] = 'javax::mail::internet::MimeBodyPart'->new($internetHeaders, [unpack("C*", $htmlAttachment)]);
            }
            $self->init($server, undef, ['javax::mail::internet::InternetAddress'->new($from)], ['javax::mail::internet::InternetAddress'->new($to)], undef, undef, $subject, $mimeBodyParts);
        } catch ($e) {
            if ($org::allbinary::logic::communication::smtp::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGINGERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "emailConstructor", $e);
            }
            die $e;
        }
}


# throws MessagingException
# Java overloaded method: Perl keeps the last definition
sub init {
    my ($self, $server, $authenticator, $addresses_from, $addresses_to, $addresses_cc, $addresses_bcc, $subject, $mimeBodyParts) = @_;
        $self->{properties} = 'java::util::Properties'->new();
        $self->{properties}->put($org::allbinary::logic::communication::smtp::Email::SMTP_HOST, $server);
        try {
            my $hostName = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
            if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($hostName)) {
                if ($org::allbinary::logic::communication::smtp::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGINGERROR})) {
                    $self->{logUtil}->putF("Unable to get HostName so using fake", $self, "init()");
                }
                $self->{properties}->put($org::allbinary::logic::communication::smtp::Email::SMTP_LOCAL_HOST, "FakeHostName");
            }
        } catch ($e) {
            if ($org::allbinary::logic::communication::smtp::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGINGERROR})) {
                $self->{logUtil}->put("Continuing on Exception: Unable to get HostName", $self, "init()", $e);
            }
            $self->{properties}->put($org::allbinary::logic::communication::smtp::Email::SMTP_LOCAL_HOST, "FakeHostName");
        }
        if ($self->{isDebug}) {
            $self->{properties}->put($org::allbinary::logic::communication::smtp::Email::DEBUG, "true");
        }
        my $session = 'javax::mail::Session'->getInstance($self->{properties}, $authenticator);
        if ($self->{isDebug}) {
            $session->setDebug(1);
            $self->{bs} = 'java::io::ByteArrayOutputStream'->new();
            my $printStream = 'java::io::PrintStream'->new($self->{bs});
            $session->setDebugOut($printStream);
        }
        $self->{msg} = 'javax::mail::internet::MimeMessage'->new($session);
        $self->{msg}->addFrom($addresses_from);
        $self->{msg}->setRecipients($javax::mail::Message::RecipientType->{TO}, $addresses_to);
        $self->{msg}->setRecipients($javax::mail::Message::RecipientType->{CC}, $addresses_cc);
        $self->{msg}->setRecipients($javax::mail::Message::RecipientType->{BCC}, $addresses_bcc);
        $self->{msg}->setSubject($subject);
        my $mimeMultipart = 'javax::mail::internet::MimeMultipart'->new();
        for (my $i = 0; $i < scalar(@{$mimeBodyParts}); $i++) {
            $mimeMultipart->addBodyPart($mimeBodyParts->[$i]);
        }
        $self->{msg}->setContent($mimeMultipart);
}


sub getMimeMessage {
    my ($self) = @_;
        return $self->{msg};
}


sub getDebugInfo {
    my ($self) = @_;
        if ($self->{isDebug}) {
            return "More Logging Before This To Standard Out: " . ("" . $self->{bs}->toString());
        } else {
            return "Debugging Is Off";
        }
}


# throws Exception
sub log {
    my ($self) = @_;
        return "\nHashMap: " . $self->toHashMap()->toString();
}


# throws Exception
sub toHashMap {
    my ($self) = @_;
        try {
            my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $hashMap->put($org::allbinary::logic::communication::smtp::EmailData::SERVER, $self->{properties}->get($org::allbinary::logic::communication::smtp::Email::SMTP_HOST));
            my $addresses = $self->{msg}->getFrom();
            if (defined($addresses)) {
                for (my $index = 0; $index < scalar(@{$addresses}); $index++) {
                    $hashMap->put($org::allbinary::logic::communication::smtp::EmailData::FROM, $addresses->[$index]->toString());
                }
            }
            $addresses = $self->{msg}->getRecipients($javax::mail::Message::RecipientType->{TO});
            if (defined($addresses)) {
                for (my $index = 0; $index < scalar(@{$addresses}); $index++) {
                    $hashMap->put($org::allbinary::logic::communication::smtp::EmailData::TO, $addresses->[$index]->toString());
                }
            }
            $addresses = $self->{msg}->getRecipients($javax::mail::Message::RecipientType->{CC});
            if (defined($addresses)) {
                for (my $index = 0; $index < scalar(@{$addresses}); $index++) {
                    $hashMap->put($org::allbinary::logic::communication::smtp::EmailData::CC, $addresses->[$index]->toString());
                }
            }
            $addresses = $self->{msg}->getRecipients($javax::mail::Message::RecipientType->{BCC});
            if (defined($addresses)) {
                for (my $index = 0; $index < scalar(@{$addresses}); $index++) {
                    $hashMap->put($org::allbinary::logic::communication::smtp::EmailData::BCC, $addresses->[$index]->toString());
                }
            }
            $hashMap->put($org::allbinary::logic::communication::smtp::EmailData::SUBJECT, $self->{msg}->getSubject());
            my $mimeMultipart = $self->{msg}->getContent();
            if (defined($mimeMultipart)) {
                for (my $index = 0; $index < $mimeMultipart->getCount(); $index++) {
                    my $content = $mimeMultipart->getBodyPart($index)->getContent();
                    $hashMap->put($org::allbinary::logic::communication::smtp::EmailData::CONTENT, $content);
                }
            }
            return $hashMap;
        } catch ($e) {
            if ($org::allbinary::logic::communication::smtp::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "toHashMap()", $e);
            }
            die $e;
        }
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::logic::communication::smtp::EmailData::NAME, $self->toHashMap());
        return $node;
}


# throws Exception
sub toXmlDoc {
    my ($self) = @_;
        die ('org::allbinary::string::CommonStrings'->getInstance()->{NOT_IMPLEMENTED});
}

# use java::io::ByteArrayOutputStream;
# use java::io::PrintStream;
use java::util::HashMap;
# use java::util::Properties;
# use javax::mail::Address;
# use javax::mail::Authenticator;
# use javax::mail::Message;
# use javax::mail::MessagingException;
# use javax::mail::Session;
# use javax::mail::internet::InternetAddress;
# use javax::mail::internet::InternetHeaders;
# use javax::mail::internet::MimeBodyPart;
# use javax::mail::internet::MimeMessage;
# use javax::mail::internet::MimeMultipart;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::communication::smtp::EmailInterface;
use org::allbinary::logic::communication::smtp::EmailData;

1;

