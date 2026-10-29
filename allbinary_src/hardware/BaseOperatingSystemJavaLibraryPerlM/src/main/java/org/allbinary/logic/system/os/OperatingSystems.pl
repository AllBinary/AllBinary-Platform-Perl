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

package org::allbinary::logic::system::os::OperatingSystems;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::os::OperatingSystems'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{LINUX} = "Linux";
    $self->{WINDOWS} = "Windows";
    $self->{SOLARIS} = "Solaris";
    $self->{WINDOWS2000} = "Windows 2000";
    $self->{WINDOWS_NT} = "Windows NT";
    $self->{WINDOWS_10} = "Windows 10";
    $self->{WINDOWS_11} = "Windows 11";
    $self->{WINDOWS_VISTA} = "Windows Vista";
    $self->{WINDOWS_XP} = "Windows XP";
    $self->{ANDROID} = $self->{LINUX};
    $self->{HARMONY} = "HarmonyOS";
    $self->{unknownSpecificOSAllowed} = 1;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub isUnknownSpecificOSAllowed {
    my ($self) = @_;
        return $self->{unknownSpecificOSAllowed};
}


sub setUnknownSpecificOSAllowed {
    my ($self, $aUnknownSpecificOSAllowed) = @_;
        $self->{unknownSpecificOSAllowed} = $aUnknownSpecificOSAllowed;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::os::OperatingSystems::instance;
}


1;

