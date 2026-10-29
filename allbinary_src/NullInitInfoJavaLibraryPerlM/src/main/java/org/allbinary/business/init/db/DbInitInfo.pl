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

#import org.allbinary.logic.communication.log.config.type.LogConfigTypes;
package org::allbinary::business::init::db::DbInitInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::init::db::DbConnectionInfo';



sub new {
    my ($class, $initFileName, $read) = @_;
    my $self = $class->SUPER::new();
        # super(...) made $self above
    return $self;
}


sub getUrl {
    my ($self) = @_;
        my $url = $self->SUPER::getUrl();
        'org::allbinary::logic::communication::log::PreLogUtil'->put("Url: " . $url, $self, "getUrl");
        return $url;
}


# throws Exception
sub write {
    my ($self) = @_;
}


# throws Exception
sub load {
    my ($self) = @_;
}


sub setHasRead {
    my ($self, $value) = @_;
}

use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::business::init::db::DbConnectionInfo;

1;

