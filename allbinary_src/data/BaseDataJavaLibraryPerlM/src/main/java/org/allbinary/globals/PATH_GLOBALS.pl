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

package org::allbinary::globals::PATH_GLOBALS;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::globals::PATH_GLOBALS'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{DATA_PATH} = undef;
    $self->{INIT_PATH} = undef;
    $self->{VIEWS_PATH} = undef;
    $self->{LOG_PATH} = undef;
    $self->{BACKUP_PATH} = undef;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::globals::PATH_GLOBALS::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $abPathData = 'org::allbinary::logic::io::path::AbPathData'->getInstance();
        $stringBuffer->append("data");
        $stringBuffer->append($abPathData->{SEPARATOR});
        $self->{DATA_PATH} = $stringBuffer->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($self->{DATA_PATH});
        $stringBuffer->append('org::allbinary::string::CommonStrings'->getInstance()->{INIT});
        $stringBuffer->append($abPathData->{SEPARATOR});
        $self->{INIT_PATH} = $stringBuffer->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($self->{DATA_PATH});
        $stringBuffer->append("log");
        $stringBuffer->append($abPathData->{SEPARATOR});
        $self->{LOG_PATH} = $stringBuffer->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($self->{DATA_PATH});
        $stringBuffer->append("backup");
        $stringBuffer->append($abPathData->{SEPARATOR});
        $self->{BACKUP_PATH} = $stringBuffer->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($self->{INIT_PATH});
        $stringBuffer->append("views");
        $stringBuffer->append($abPathData->{SEPARATOR});
        $self->{VIEWS_PATH} = $stringBuffer->toString();
    return $self;
}

use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;

1;

