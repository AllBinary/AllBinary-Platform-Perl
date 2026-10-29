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

package org::allbinary::logic::communication::smtp::EmailsNotUsed;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{emailInfoVector} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{emailInfoVector} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        try {
            if ($org::allbinary::logic::communication::smtp::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PAYMENT})) {
                $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "toXmlNode");
            }
            my $node = $document->createElement($org::allbinary::logic::communication::smtp::EmailData::NAME);
            my $size = $self->{emailInfoVector}->size();
            for (my $index = 0; $index < $size; $index++) {
                my $email = $self->{emailInfoVector}->get($index);
                my $emailNode = $email->toXmlNode($document);
                if (defined($emailNode)) {
                    $node->appendChild($emailNode);
                }
            }
            if ($org::allbinary::logic::communication::smtp::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PAYMENT})) {
                $self->{logUtil}->putF($self->{commonStrings}->{END}, $self, "toXmlNode()");
            }
            return $node;
        } catch ($e) {
            if ($org::allbinary::logic::communication::smtp::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "toXmlNode()", $e);
            }
            my $error = "Error Processing Order.  Please contact us if error persists.<p/>";
            return 'org::allbinary::data::tree::dom::BasicErrorNodeUtil'->get($document, $error);
        }
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tree::dom::BasicErrorNodeUtil;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::communication::smtp::EmailData;

1;

