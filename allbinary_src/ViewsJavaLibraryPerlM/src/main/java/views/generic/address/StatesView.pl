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

package views::generic::address::StatesView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub toXmlNode {
    my ($self, $document) = @_;
        try {
            my $node = $document->createElement($org::allbinary::business::user::address::StreetAddressData::STATES);
            my $statesFile = 'org::allbinary::globals::URLGLOBALS'->getMainPath() + 'org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{LINEDATAPATH} . "states.txt";
            my $lineReader = 'org::allbinary::logic::io::LineReader'->new($statesFile);
            while ($lineReader->hasNext()) {
                my $option = $lineReader->next();
                $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::address::StreetAddressData::STATE, $option));
            }
            return $node;
        } catch ($e) {
            if ($views::generic::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "toXmlNode", $e);
            }
            return undef;
        }
}

use org::allbinary::business::user::address::StreetAddressData;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::globals::FREEBLISKET_PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::LineReader;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;

1;

