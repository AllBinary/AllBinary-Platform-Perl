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

package org::allbinary::logic::system::security::licensing::PartnerIdentifierFileUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::security::licensing::PartnerIdentifierFileUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{FILE_NAME} = "partner.txt";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::security::licensing::PartnerIdentifierFileUtil::instance;
}


sub get {
    my ($self) = @_;
        try {
            my $resourceUtil = 'org::allbinary::data::resource::ResourceUtil'->getInstance();
            my $partnerString = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
            return $partnerString;
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET}, $e);
            return 'org::allbinary::logic::string::StringUtil'->getInstance()->{NULL_STRING};
        }
}

use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;

1;

