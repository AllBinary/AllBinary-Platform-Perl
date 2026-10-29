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

# Java interface
package org::allbinary::logic::io::file::AbFileInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub canRead {
    my ($self) = @_;
    die "abstract method canRead";
}


sub canWrite {
    my ($self) = @_;
    die "abstract method canWrite";
}


# throws IOException
sub createNewFile {
    my ($self) = @_;
    die "abstract method createNewFile";
}


# throws IOException
sub delete {
    my ($self) = @_;
    die "abstract method delete";
}


sub deleteOnExit {
    my ($self) = @_;
    die "abstract method deleteOnExit";
}


sub exists {
    my ($self) = @_;
    die "abstract method exists";
}


sub getAbsolutePath {
    my ($self) = @_;
    die "abstract method getAbsolutePath";
}


# throws IOException
sub getCanonicalPath {
    my ($self) = @_;
    die "abstract method getCanonicalPath";
}


sub getParent {
    my ($self) = @_;
    die "abstract method getParent";
}


sub getPath {
    my ($self) = @_;
    die "abstract method getPath";
}


sub isAbsolute {
    my ($self) = @_;
    die "abstract method isAbsolute";
}


sub isDirectory {
    my ($self) = @_;
    die "abstract method isDirectory";
}


sub isFile {
    my ($self) = @_;
    die "abstract method isFile";
}


sub isHidden {
    my ($self) = @_;
    die "abstract method isHidden";
}


sub lastModified {
    my ($self) = @_;
    die "abstract method lastModified";
}


sub length {
    my ($self) = @_;
    die "abstract method length";
}


sub list {
    my ($self) = @_;
    die "abstract method list";
}


sub listWithFilter {
    my ($self, $filter) = @_;
    die "abstract method listWithFilter";
}


sub mkdir {
    my ($self) = @_;
    die "abstract method mkdir";
}


sub mkdirs {
    my ($self) = @_;
    die "abstract method mkdirs";
}


sub setLastModified {
    my ($self, $time) = @_;
    die "abstract method setLastModified";
}


sub setReadOnly {
    my ($self) = @_;
    die "abstract method setReadOnly";
}


sub toString {
    my ($self) = @_;
    die "abstract method toString";
}


sub toURI {
    my ($self) = @_;
    die "abstract method toURI";
}

# use java::io::FilenameFilter;
# use java::io::IOException;
# use java::net::URI;

1;

