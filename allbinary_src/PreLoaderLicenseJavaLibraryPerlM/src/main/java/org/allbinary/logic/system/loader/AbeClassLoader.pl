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

package org::allbinary::logic::system::loader::AbeClassLoader;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::loader::ClassLoader';

our $classes = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
our $PATH;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{abCryptUtil} = 'org::allbinary::logic::system::security::AbCryptUtil'->getInstance();
    $self->{LOAD_CLASS} = "loadClass";
    $self->{ENCRYPTED_EXTENSION} = 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP} . "abc";
    $self->{key} = undef;
}


sub new {
    my ($class, $parent, $key) = @_;
    my $self = $class->SUPER::new($parent);
    $self->_init_fields();
        # super(...) made $self above
        $self->{key} = $key;
        $org::allbinary::logic::system::loader::AbeClassLoader::PATH = $org::allbinary::logic::system::loader::org::allbinary->{globals}->{URLGLOBALS}->getWebappPath() . "WEB-INF/classes/";
    return $self;
}


sub findLoadedClass1 {
    my ($self, $name) = @_;
        return $org::allbinary::logic::system::loader::AbeClassLoader::classes->get($name);
}


# throws ClassNotFoundException
sub loadClass {
    my ($self, $name) = @_;
        return $self->loadClass($name, 0);
}


# throws ClassNotFoundException
# Java overloaded method: Perl keeps the last definition
sub loadClass {
    my ($self, $name, $resolve) = @_;
        my $loadedWith = "findLoadedClass1";
        my $logBuffer = 'org::allbinary::logic::communication::log::LogBuffer'->new();
        try {
            my $myClass = $self->findLoadedClass1($name);
            if (!defined($myClass)) {
                try {
                    $loadedWith = "super.loadClass";
                    my $normalClass = $self->SUPER::loadClass($name, $resolve);
                    if (defined($normalClass)) {
                        return $normalClass;
                    }
                } catch ($e) {
                    $logBuffer->add('org::allbinary::logic::communication::log::LogFactory'->getInstance("Failed to Load Class: " . $name . "\nwith: " . $loadedWith, $self, $self->{LOAD_CLASS}, $e));
                }
                my $classBytes = $self->loadClassBytesFromFile($name);
                if (!defined($classBytes)) {
                    die ("My Bytes not loaded for: " . $name . "\nwith: " . "loadClassBytes");
                }
                $myClass = $self->defineClass($name, $classBytes, 0, scalar(@{$classBytes}));
                if (!defined($myClass)) {
                    die ("My Class Not Defineable for: " . $name . "\nwith: " . "loadClassBytes");
                }
                $org::allbinary::logic::system::loader::AbeClassLoader::classes->put($name, $myClass);
            } else {
                $logBuffer->add('org::allbinary::logic::communication::log::LogFactory'->getInstanceF("Already Loaded: " . $name . "\nwith: " . $loadedWith, $self, $self->{LOAD_CLASS}));
            }
            $self->resolveClass($myClass);
            return $myClass;
        } catch ($e) {
            if ($org::allbinary::logic::system::loader::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::system::loader::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{LOADERERROR})) {
                $logBuffer->logAll();
                $self->{logUtil}->put("Failure loading: " . $name . "\nwith: " . $loadedWith, $self, $self->{LOAD_CLASS}, $e);
            }
            return undef;
        }
}


sub loadClassBytesFromFile {
    my ($self, $name) = @_;
        my $in = undef;
        my $cname = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        try {
            $cname = $org::allbinary::logic::system::loader::AbeClassLoader::PATH . join('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATORCHAR}, split(quotemeta("."), $name, -1)) . $self->{ENCRYPTED_EXTENSION};
            $in = 'java::io::FileInputStream'->new($cname);
            my $decrypted = $self->{abCryptUtil}->decrypt($in, $self->{key});
            return $decrypted;
        } catch ($e) {
            if ($org::allbinary::logic::system::loader::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::system::loader::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{LOADERERROR})) {
                $self->{logUtil}->put("(Before LogBuffer Output) Failure loading Encrypted: " . $name . " File: " . $cname, "AbeClassLoader", "loadClassBytes", $e);
            }
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($in);
        }
        return undef;
}


# throws ClassNotFoundException
sub oldLoadClass {
    my ($self, $name, $resolve) = @_;
        my $loadedWith = "findLoadedClass1";
        try {
            my $myClass = $self->findLoadedClass1($name);
            if (!defined($myClass)) {
                try {
                    $loadedWith = "super.loadClass";
                    my $normalClass = $self->SUPER::loadClass($name, $resolve);
                    if (defined($normalClass)) {
                        return $normalClass;
                    }
                } catch ($e) {
                    if ($org::allbinary::logic::system::loader::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::system::loader::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{LOADER})) {
                        $self->{logUtil}->putF("Failed Loaded Class: " . $name . " with: " . $loadedWith, $self, $self->{LOAD_CLASS});
                    }
                }
                $loadedWith = "loadClassBytes";
                my $classBytes = $self->loadClassBytesFromFile($name);
                if (!defined($classBytes)) {
                    die ("Bytes not loaded for: " . $name);
                }
                $myClass = $self->defineClass($name, $classBytes, 0, scalar(@{$classBytes}));
                if (!defined($myClass)) {
                    die ("Class Not Defineable for: " . $name);
                }
                $org::allbinary::logic::system::loader::AbeClassLoader::classes->put($name, $myClass);
            } else {
                if ($org::allbinary::logic::system::loader::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::system::loader::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{LOADER})) {
                    $self->{logUtil}->putF("Already Loaded: " . $name . " with: " . $loadedWith, $self, $self->{LOAD_CLASS});
                }
            }
            $self->resolveClass($myClass);
            return $myClass;
        } catch ($e) {
            if ($org::allbinary::logic::system::loader::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::system::loader::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{LOADERERROR})) {
                $self->{logUtil}->put("Failure loading: " . $name, "AbeClassLoader", $self->{LOAD_CLASS}, $e);
            }
            return undef;
        }
}

# use java::io::FileInputStream;
# use java::io::IOException;
# use java::util::Map;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogBuffer;
use org::allbinary::logic::communication::log::LogFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::security::AbCryptUtil;
use org::allbinary::logic::system::loader::ClassLoader;

1;

