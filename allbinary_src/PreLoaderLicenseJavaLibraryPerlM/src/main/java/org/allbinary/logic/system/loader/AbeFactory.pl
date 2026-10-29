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

package org::allbinary::logic::system::loader::AbeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::loader::AbeFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{useCustomLoader} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::loader::AbeFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws LicensingException
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $abeClientInformation, $className) = @_;
        try {
            return $self->getClass($abeClientInformation, $className)->newInstance();
        } catch ($e) {
            if ($org::allbinary::logic::system::loader::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::system::loader::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{LOADERERROR})) {
                $self->{logUtil}->put("Failure for: " . $className, $self, "getInstance(classname)", $e);
            }
            die $e;
        }
}


# throws LicensingException
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $abeClientInformation, $className, $classes, $params) = @_;
        my $constructor = undef;
        try {
            my $parent = 'org::allbinary::logic::system::loader::WebappClassLoaderInfo'->getLoader();
            if ($self->{useCustomLoader}) {
                my $loader = 'org::allbinary::logic::system::loader::AbeClassLoader'->new($parent, 'org::allbinary::logic::system::security::AbKeys'->getInstance()->getKey($abeClientInformation, $className));
                my $myClass = $loader->loadClass($className);
                $constructor = $myClass->getConstructor($classes);
                return $constructor->newInstance($params);
            } else {
                my $myClass = $parent->loadClass($className);
                $constructor = $myClass->getConstructor($classes);
                return $constructor->newInstance($params);
            }
        } catch ($e) {
            if ($org::allbinary::logic::system::loader::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::system::loader::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{LOADERERROR})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Failure for: ");
                $stringBuffer->append($className);
                $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
                $stringBuffer->append('org::allbinary::logic::java::anyType::ConstructorUtil'->view($constructor, 'org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE}));
                $self->{logUtil}->put($stringBuffer->toString(), $self, "getInstance(className,params)", $e);
            }
            die $e;
        }
}


# throws LicensingException
sub getClass {
    my ($self, $abeClientInformation, $className) = @_;
        try {
            my $parent = 'org::allbinary::logic::system::loader::WebappClassLoaderInfo'->getLoader();
            if ($self->{useCustomLoader}) {
                my $loader = 'org::allbinary::logic::system::loader::AbeClassLoader'->new($parent, 'org::allbinary::logic::system::security::AbKeys'->getInstance()->getKey($abeClientInformation, $className));
                my $c = $loader->loadClass($className);
                return $c;
            } else {
                my $c = $parent->loadClass($className);
                return $c;
            }
        } catch ($e) {
            if ($org::allbinary::logic::system::loader::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::system::loader::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{LOADERERROR})) {
                $self->{logUtil}->put("Failure for: " . $className, $self, "getClass(className)", $e);
            }
            die $e;
        }
}

# use java::lang::reflect::Constructor;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::java::anyType::ConstructorUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::AbKeys;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::LicensingException;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::system::loader::WebappClassLoaderInfo;
use org::allbinary::logic::system::loader::AbeClassLoader;

1;

