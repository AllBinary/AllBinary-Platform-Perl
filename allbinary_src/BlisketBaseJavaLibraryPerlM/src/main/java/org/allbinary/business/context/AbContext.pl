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

package org::allbinary::business::context::AbContext;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{propertiesHashMap} = undef;
    $self->{pageContext} = undef;
}


sub new {
    my ($class, $propertiesHashMap, $pageContext) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($org::allbinary::business::context::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::context::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Properties HashMap: " . $propertiesHashMap->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
        $self->{propertiesHashMap} = $propertiesHashMap;
        $self->{pageContext} = $pageContext;
    return $self;
}


sub getWeblisketSession {
    my ($self) = @_;
        return 'org::allbinary::logic::communication::http::request::session::WeblisketSession'->new($self->{propertiesHashMap}, $self->{pageContext});
}


sub getPageContext {
    my ($self) = @_;
        return $self->{pageContext};
}


sub getPropertiesHashMap {
    my ($self) = @_;
        return $self->{propertiesHashMap};
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::logic::communication::http::request::session::WeblisketSession;
use org::allbinary::logic::communication::http::request::session::WeblisketSessionInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

