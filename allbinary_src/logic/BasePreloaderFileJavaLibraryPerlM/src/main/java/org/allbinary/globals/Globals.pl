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

package org::allbinary::globals::Globals;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::globals::Globals'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::globals::Globals::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub init {
    my ($self, $classLoader, $pathString) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $appUrlGlobals = 'org::allbinary::globals::AppUrlGlobals'->new();
        $appUrlGlobals->setWebappPath($pathString);
        $self->{URLGLOBALS}->init($appUrlGlobals);
        'org::allbinary::logic::system::loader::WebappClassLoaderInfo'->setLoader($classLoader);
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Setting Up AllBinary System Configuration Args: ");
        $stringBuffer->append($pathString);
        $stringBuffer->append(" ClassLoader: ");
        $stringBuffer->append(ref($classLoader));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, $commonStrings->{INIT});
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        if ($stringValidationUtil->isEmpty($pathString)) {
            $stringBuffer->delete(0, $stringBuffer->length());
            $stringBuffer->append("No Path Provided. Using Process Path: ");
            $stringBuffer->append($pathString);
            $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
            $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{EQUALS});
            $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
            $stringBuffer->append($self->{URLGLOBALS}->getWebappPath());
            $self->{logUtil}->putF($stringBuffer->toString(), $self, $commonStrings->{INIT});
        }
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append("Webapp Path Set To: ");
        $stringBuffer->append($self->{URLGLOBALS}->getWebappPath());
        $self->{logUtil}->putF($stringBuffer->toString(), $self, $commonStrings->{INIT});
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::system::loader::WebappClassLoaderInfo;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::globals::AppUrlGlobals;

1;

