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

package org::allbinary::logic::system::hardware::SystemHardwareFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::SystemHardwareFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{hardwareInterface} = java::lang::Object::jstatic('org::allbinary::logic::system::hardware::SystemHardwareFactory', 'NoHardware')->getInstance();
}


sub getInstance_j0 {
    my ($class) = @_;
        return $org::allbinary::logic::system::hardware::SystemHardwareFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getInstance_j1 {
    my ($self, $operatingSystemInterface) = @_;
        try {
            if ($self->{hardwareInterface} == java::lang::Object::jstatic('org::allbinary::logic::system::hardware::SystemHardwareFactory', 'NoHardware')->getInstance()) {
                $self->{hardwareInterface} = java::lang::Object::jstatic('org::allbinary::logic::system::hardware::SystemHardwareFactory', 'HardwareFactory')->getInstance()->getInstance($operatingSystemInterface);
            }
            $self->{logUtil}->putF("Found Hardware", $self, $self->{commonStrings}->{CONSTRUCTOR});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{CONSTRUCTOR}, $e);
        }
        return $self->{hardwareInterface};
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->getInstance_j1(@arguments) if scalar(@arguments) == 1;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}


sub static_toString {
    my ($class) = @_;
        my $systemHardwareFactory = 'org::allbinary::logic::system::hardware::SystemHardwareFactory'->getInstance();
        my $osBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $osBuffer->append("Hardware Info: \n");
        if (defined($systemHardwareFactory->{hardwareInterface})) {
            $osBuffer->append($systemHardwareFactory->{hardwareInterface}->toString());
        } else {
            $osBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->{NULL_STRING});
        }
        return $osBuffer->toString();
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::string::StringMaker ();
use org::allbinary::logic::string::StringUtil ();
use org::allbinary::logic::system::os::GenericOperatingSystem ();
use org::allbinary::string::CommonStrings ();

1;

