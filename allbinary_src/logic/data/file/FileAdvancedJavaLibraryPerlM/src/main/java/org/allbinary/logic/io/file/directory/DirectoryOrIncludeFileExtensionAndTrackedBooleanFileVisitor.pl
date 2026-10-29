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

package org::allbinary::logic::io::file::directory::DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::io::file::visitor::IncludeFileExtensionsBooleanFileVisitor';


sub _init_fields {
    my ($self) = @_;
    $self->{trackedStrings} = 'org::allbinary::logic::io::file::directory::TrackedStrings'->getInstance();
    $self->{gitProcessHelper} = 'org::allbinary::java::runtime::process::git::GitProcessHelper'->getInstance();
    $self->{includesString} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    die "No constructor of DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $filterStringBasicArrayList) = @_;
    my $self = $class->SUPER::new($filterStringBasicArrayList);
    $self->_init_fields();
        # super(...) made $self above
        $self->{includesString} = undef;
    return $self;
}


sub _new2 {
    my ($class, $filterStringBasicArrayList, $includesString) = @_;
    my $self = $class->SUPER::new($filterStringBasicArrayList);
    $self->_init_fields();
        # super(...) made $self above
        $self->{includesString} = $includesString;
    return $self;
}


sub visit {
    my ($self, $file) = @_;
        if ($file->isDirectory()) {
            return 1;
        }
        if (!defined($self->{includesString}) || $file->getAbsolutePath()->indexOf($self->{includesString}) >= 0) {
            return $self->SUPER::visit($file);
        } else {
            return 0;
        }
}


# Java overloaded method: Perl keeps the last definition
sub visit {
    my ($self, $file, $fileNameString) = @_;
        my $filePath = $file->getPath();
        if ($self->SUPER::visit($file, $fileNameString)) {
            if (!((index($filePath, $self->{trackedStrings}->{APPLICATION}) >= 0) || (index($filePath, $self->{trackedStrings}->{APP}) >= 0) || (index($filePath, $self->{trackedStrings}->{HTML_TEMP}) >= 0))) {
                if (!((index($filePath, $self->{trackedStrings}->{TARGET_PATH_WINDOWS}) >= 0) || (index($filePath, $self->{trackedStrings}->{TARGET_PATH_UNIX}) >= 0))) {
                    if ($self->{gitProcessHelper}->isTracked($file)) {
                        return 1;
                    } else {
                    }
                } else {
                }
            } else {
            }
        }
        return 0;
}


sub main {
    my ($class, $args) = @_;
        my $commonFileStrings = 'org::allbinary::logic::io::file::CommonDataFileStrings'->getInstance();
        my $list = 'org::allbinary::util::BasicArrayListD'->new();
        $list->add($commonFileStrings->{JAVA});
        my $filePath = "G:\\mnt\\bc\\mydev\\games\\ZeptoRacer\\platform\\j2se\\ZeptoRacerStaticPathsJ2SEM\\target\\dependency\\org\\allbinary\\logic\\system\\security\\licensing\\ZeptoRacerPCClientInformation.java";
        my $result = 'org::allbinary::logic::io::file::directory::DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor'->new($list)->visit('org::allbinary::logic::io::file::AbFile'->createAbFileFromRawPath($filePath));
        print($filePath . " is Tracked: " . $result, "\n");
}

use org::allbinary::java::runtime::process::git::GitProcessHelper;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::CommonDataFileStrings;
use org::allbinary::logic::io::file::visitor::IncludeFileExtensionsBooleanFileVisitor;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::io::file::directory::TrackedStrings;
use java::lang::System;

1;

