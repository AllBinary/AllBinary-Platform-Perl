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

package org::allbinary::logic::io::file::FileListFetcher;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::io::file::FileListFetcher'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{subDirectory} = 'org::allbinary::logic::io::file::directory::SubDirectory'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::FileListFetcher::instance;
}


sub getFiles_j1 {
    my ($self, $path) = @_;
        try {
            my $files = $self->{subDirectory}->search('org::allbinary::logic::io::file::AbFile'->createAbFile($path));
            return $files;
        } catch ($e) {
            print(STDERR $e, "\n");
            print("Error: " . $e . "\nMsg: " . ("" . $e), "\n");
        }
        return undef;
}


sub getFiles_j2_1 {
    my ($self, $path, $includeExtensions) = @_;
        try {
            my $includeExtensionBasicArrayList = 'org::allbinary::util::BasicArrayListD'->new();
            my $size = scalar(@{$includeExtensions});
            for (my $index = 0; $index < $size; $index++) {
                $includeExtensionBasicArrayList->add($includeExtensions->[$index]);
            }
            my $visitorFileFilter = 'org::allbinary::logic::io::file::filter::VisitorFileFilter'->new('org::allbinary::logic::io::file::directory::DirectoryOrIncludeFileExtensionBooleanFileVisitor'->new($includeExtensionBasicArrayList));
            my $files = $self->{subDirectory}->search($visitorFileFilter, 'org::allbinary::logic::io::file::AbFile'->createAbFile($path));
            return $files;
        } catch ($e) {
            print(STDERR $e, "\n");
            print("Error: " . $e . "\nMsg: " . ("" . $e), "\n");
        }
        return undef;
}


sub getFiles_j2_2 {
    my ($self, $path, $includeExtension) = @_;
        try {
            my $includeExtensionBasicArrayList = 'org::allbinary::util::BasicArrayListD'->new();
            $includeExtensionBasicArrayList->add($includeExtension);
            my $visitorFileFilter = 'org::allbinary::logic::io::file::filter::VisitorFileFilter'->new('org::allbinary::logic::io::file::directory::DirectoryOrIncludeFileExtensionBooleanFileVisitor'->new($includeExtensionBasicArrayList));
            my $files = $self->{subDirectory}->search($visitorFileFilter, 'org::allbinary::logic::io::file::AbFile'->createAbFile($path));
            return $files;
        } catch ($e) {
            print(STDERR $e, "\n");
            print("Error: " . $e . "\nMsg: " . ("" . $e), "\n");
        }
        return undef;
}


sub getFiles_j3 {
    my ($self, $path, $pathIncludes, $includeExtension) = @_;
        try {
            my $includeExtensionBasicArrayList = 'org::allbinary::util::BasicArrayListD'->new();
            $includeExtensionBasicArrayList->add($includeExtension);
            my $visitorFileFilter = 'org::allbinary::logic::io::file::filter::VisitorFileFilter'->new('org::allbinary::logic::io::file::directory::DirectoryOrIncludeFileExtensionBooleanFileVisitor'->new($includeExtensionBasicArrayList, $pathIncludes));
            my $files = $self->{subDirectory}->search($visitorFileFilter, 'org::allbinary::logic::io::file::AbFile'->createAbFile($path));
            return $files;
        } catch ($e) {
            print(STDERR $e, "\n");
            print("Error: " . $e . "\nMsg: " . ("" . $e), "\n");
        }
        return undef;
}

sub getFiles {
    my ($invocant, @arguments) = @_;
    return $invocant->getFiles_j1(@arguments) if scalar(@arguments) == 1;
    return $invocant->getFiles_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->getFiles_j3(@arguments) if scalar(@arguments) == 3;
    die "No method getFiles takes " . scalar(@arguments) . " arguments";
}

sub getFiles_j2 {
    my ($invocant, @arguments) = @_;
    return $invocant->getFiles_j2_1(@arguments) if 1 && !ref($arguments[0]) && (!defined($arguments[1]) || ref($arguments[1]) eq 'ARRAY');
    return $invocant->getFiles_j2_2(@arguments);
}


sub getTrackedFiles_j2_1 {
    my ($self, $path, $includeExtensions) = @_;
        try {
            my $includeExtensionBasicArrayList = 'org::allbinary::util::BasicArrayListD'->new();
            my $size = scalar(@{$includeExtensions});
            for (my $index = 0; $index < $size; $index++) {
                $includeExtensionBasicArrayList->add($includeExtensions->[$index]);
            }
            my $visitorFileFilter = 'org::allbinary::logic::io::file::filter::VisitorFileFilter'->new('org::allbinary::logic::io::file::directory::DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor'->new($includeExtensionBasicArrayList));
            my $files = $self->{subDirectory}->search($visitorFileFilter, 'org::allbinary::logic::io::file::AbFile'->createAbFile($path));
            return $files;
        } catch ($e) {
            print(STDERR $e, "\n");
            print("Error: " . $e . "\nMsg: " . ("" . $e), "\n");
        }
        return undef;
}


sub getTrackedFiles_j2_2 {
    my ($self, $path, $includeExtension) = @_;
        try {
            my $includeExtensionBasicArrayList = 'org::allbinary::util::BasicArrayListD'->new();
            $includeExtensionBasicArrayList->add($includeExtension);
            my $visitorFileFilter = 'org::allbinary::logic::io::file::filter::VisitorFileFilter'->new('org::allbinary::logic::io::file::directory::DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor'->new($includeExtensionBasicArrayList));
            my $files = $self->{subDirectory}->search($visitorFileFilter, 'org::allbinary::logic::io::file::AbFile'->createAbFile($path));
            return $files;
        } catch ($e) {
            print(STDERR $e, "\n");
            print("Error: " . $e . "\nMsg: " . ("" . $e), "\n");
        }
        return undef;
}

sub getTrackedFiles {
    my ($invocant, @arguments) = @_;
    return $invocant->getTrackedFiles_j2(@arguments) if scalar(@arguments) == 2;
    die "No method getTrackedFiles takes " . scalar(@arguments) . " arguments";
}

sub getTrackedFiles_j2 {
    my ($invocant, @arguments) = @_;
    return $invocant->getTrackedFiles_j2_1(@arguments) if 1 && !ref($arguments[0]) && (!defined($arguments[1]) || ref($arguments[1]) eq 'ARRAY');
    return $invocant->getTrackedFiles_j2_2(@arguments);
}


sub getDirectories {
    my ($self, $path) = @_;
        try {
            my $visitorFileFilter = 'org::allbinary::logic::io::file::filter::VisitorFileFilter'->new('org::allbinary::logic::io::file::directory::DirectoryBooleanFileVisitor'->new());
            my $files = $self->{subDirectory}->search($visitorFileFilter, 'org::allbinary::logic::io::file::AbFile'->createAbFile($path));
            return $files;
        } catch ($e) {
            print(STDERR $e, "\n");
            print("Error: " . $e . "\nMsg: " . ("" . $e), "\n");
        }
        return undef;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::io::file::directory::DirectoryBooleanFileVisitor ();
use org::allbinary::logic::io::file::directory::DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor ();
use org::allbinary::logic::io::file::directory::DirectoryOrIncludeFileExtensionBooleanFileVisitor ();
use org::allbinary::logic::io::file::directory::SubDirectory ();
use org::allbinary::logic::io::file::filter::VisitorFileFilter ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListD ();
use org::allbinary::logic::io::file::AbFile ();
use java::lang::System ();

1;

