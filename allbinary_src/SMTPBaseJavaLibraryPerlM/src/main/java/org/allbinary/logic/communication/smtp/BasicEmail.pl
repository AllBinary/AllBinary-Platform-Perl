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

package org::allbinary::logic::communication::smtp::BasicEmail;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::smtp::EmailInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{email} = undef;
}


sub new {
    my ($class, $emailInfo, $to) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $basicEmailInfo = $emailInfo->getBasicEmailInfo();
        $self->{email} = 'org::allbinary::logic::communication::smtp::AbEmail'->new($basicEmailInfo->getEmailServerConfigurationInterface()->getSmtpServer(), $basicEmailInfo->getEmailServerConfigurationInterface()->getAccountName(), $to, $basicEmailInfo->getSubject(), $basicEmailInfo->getTextBody(), $emailInfo->getHtmlAttachment(), $emailInfo->getContentBase());
    return $self;
}


sub getEmail {
    my ($self) = @_;
        return $self->{email}->getEmail();
}


sub getMimeMessage {
    my ($self) = @_;
        return $self->{email}->getMimeMessage();
}


sub getDebugInfo {
    my ($self) = @_;
        return $self->{email}->getDebugInfo();
}


# throws Exception
sub log {
    my ($self) = @_;
        return $self->{email}->log();
}


# throws Exception
sub toHashMap {
    my ($self) = @_;
        return $self->{email}->toHashMap();
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        return $self->{email}->toXmlNode($document);
}


# throws Exception
sub toXmlDoc {
    my ($self) = @_;
        return $self->{email}->toXmlDoc();
}

use java::util::HashMap;
# use javax::mail::internet::MimeMessage;
use org::allbinary::logic::communication::smtp::info::BasicEmailInfo;
use org::allbinary::logic::communication::smtp::info::EmailInfo;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::communication::smtp::EmailInterface;
use org::allbinary::logic::communication::smtp::AbEmail;

1;

