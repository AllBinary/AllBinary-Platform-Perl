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

package org::allbinary::globals::FREEBLISKET_PATH_GLOBALS;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{INSTALLPATH} = undef;
    $self->{XSLPATH} = undef;
    $self->{TEMPLATEPATH} = "template" . 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR};
    $self->{STYLEPATH} = $self->{TEMPLATEPATH} . "style" . 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR};
    $self->{THEMEPATH} = $self->{STYLEPATH} . "theme" . 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR};
    $self->{DBINITPATH} = $self->{PATH_GLOBALS}->getInstance()->{INIT_PATH} . "db" . 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR};
    $self->{LINEDATAPATH} = $self->{PATH_GLOBALS}->getInstance()->{INIT_PATH} . "lineData" . 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR};
    $self->{CONFIGURATIONPATH} = undef;
    $self->{USERCONFIGURATIONPATH} = undef;
    $self->{CONTEXTCONFIGURATIONPATH} = undef;
    $self->{LICENSEERRORPAGE} = "LicensingError.jsp";
    $self->{ERRORPAGE} = "Error.jsp";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::globals::FREEBLISKET_PATH_GLOBALS::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("install");
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        $self->{INSTALLPATH} = $stringBuffer->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($self->{PATH_GLOBALS}->getInstance()->{INIT_PATH});
        $stringBuffer->append("views");
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        $self->{XSLPATH} = $stringBuffer->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($self->{XSLPATH});
        $stringBuffer->append("configuration");
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        $self->{CONFIGURATIONPATH} = $stringBuffer->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($self->{CONFIGURATIONPATH});
        $stringBuffer->append("user");
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        $self->{USERCONFIGURATIONPATH} = $stringBuffer->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($self->{CONFIGURATIONPATH});
        $stringBuffer->append("context");
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        $self->{CONTEXTCONFIGURATIONPATH} = $stringBuffer->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
    return $self;
}

use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;

1;

