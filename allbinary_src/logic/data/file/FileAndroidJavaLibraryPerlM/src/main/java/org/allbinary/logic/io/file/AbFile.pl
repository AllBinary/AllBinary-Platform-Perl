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

package org::allbinary::logic::io::file::AbFile;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::io::file::AbFileInterface';

our $NULL_FILE = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromRawPath('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});

sub _init_fields {
    my ($self) = @_;
    $self->{file} = undef;
}


# throws Exception
sub createAbFileWithChild {
    my ($class, $file, $childPathName) = @_;
        return 'org::allbinary::logic::io::file::AbFile'->new('java::io::File'->new($file->getFile(), $childPathName));
}


# throws Exception
sub createAbFile {
    my ($class, $filePath) = @_;
        return 'org::allbinary::logic::io::file::AbFile'->new('java::io::File'->new('org::allbinary::logic::io::path::AbPath'->new($filePath, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING})->toFileSystemString()));
}


# throws Exception
sub createAbFilePathAndName {
    my ($class, $filePath, $fileName) = @_;
        return 'org::allbinary::logic::io::file::AbFile'->new('java::io::File'->new('org::allbinary::logic::io::path::AbPath'->new($filePath, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING})->toFileSystemString(), $fileName));
}


sub createAbFileFromAbPath {
    my ($class, $abPath) = @_;
        return 'org::allbinary::logic::io::file::AbFile'->new('java::io::File'->new($abPath->toFileSystemString()));
}


sub createAbFileFromRawPath {
    my ($class, $filePath) = @_;
        return 'org::allbinary::logic::io::file::AbFile'->new('java::io::File'->new($filePath));
}


sub new {
    my ($class, $file) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{file} = $file;
    return $self;
}


sub getFile {
    my ($self) = @_;
        return $self->{file};
}


sub getName {
    my ($self) = @_;
        return $self->{file}->getName();
}


sub getParent {
    my ($self) = @_;
        return $self->{file}->getParent();
}


sub getParentFile {
    my ($self) = @_;
        return $self->{file}->getParentFile();
}


sub getPath {
    my ($self) = @_;
        return $self->{file}->getPath();
}


sub isAbsolute {
    my ($self) = @_;
        return $self->{file}->isAbsolute();
}


sub getAbsolutePath {
    my ($self) = @_;
        return $self->{file}->getAbsolutePath();
}


sub getAbsoluteFile {
    my ($self) = @_;
        return $self->{file}->getAbsoluteFile();
}


# throws IOException
sub getCanonicalPath {
    my ($self) = @_;
        return $self->{file}->getCanonicalPath();
}


# throws IOException
sub getCanonicalFile {
    my ($self) = @_;
        return $self->{file}->getCanonicalFile();
}


sub toURI {
    my ($self) = @_;
        return $self->{file}->toURI();
}


sub canRead {
    my ($self) = @_;
        return $self->{file}->canRead();
}


sub canWrite {
    my ($self) = @_;
        return $self->{file}->canWrite();
}


sub exists {
    my ($self) = @_;
        return $self->{file}->exists();
}


sub isDirectory {
    my ($self) = @_;
        return $self->{file}->isDirectory();
}


sub isFile {
    my ($self) = @_;
        return $self->{file}->isFile();
}


sub isHidden {
    my ($self) = @_;
        return $self->{file}->isHidden();
}


sub lastModified {
    my ($self) = @_;
        return $self->{file}->lastModified();
}


sub length {
    my ($self) = @_;
        return $self->{file}->length();
}


# throws IOException
sub createNewFile {
    my ($self) = @_;
        return $self->{file}->createNewFile();
}


# throws IOException
sub delete {
    my ($self) = @_;
        return $self->{file}->delete();
}


sub deleteOnExit {
    my ($self) = @_;
        $self->{file}->deleteOnExit();
}


sub list {
    my ($self) = @_;
        return $self->{file}->list();
}


sub listWithFilter {
    my ($self, $filter) = @_;
        return $self->{file}->list($filter);
}


sub listFiles {
    my ($self) = @_;
        return $self->{file}->listFiles();
}


sub listFilesFileNameFilter {
    my ($self, $filter) = @_;
        return $self->{file}->listFiles($filter);
}


sub listFilesFileFilter {
    my ($self, $filter) = @_;
        return $self->{file}->listFiles($filter);
}


sub mkdir {
    my ($self) = @_;
        return $self->{file}->mkdir();
}


sub mkdirs {
    my ($self) = @_;
        return $self->{file}->mkdirs();
}


sub renameTo {
    my ($self, $dest) = @_;
        return $self->{file}->renameTo($dest->getFile());
}


sub setLastModified {
    my ($self, $time) = @_;
        return $self->{file}->setLastModified($time);
}


sub setReadOnly {
    my ($self) = @_;
        return $self->{file}->setReadOnly();
}


sub compareTo {
    my ($self, $pathname) = @_;
        return $self->{file}->compareTo($pathname);
}


sub equals {
    my ($self, $obj) = @_;
        return 'org::allbinary::TsUtil'->getInstance()->equalsNotstring($self->{file}, $obj);
}


sub hashCode {
    my ($self) = @_;
        return $self->{file}->hashCode();
}


sub toString {
    my ($self) = @_;
        return $self->{file}->toString();
}

use java::io::File;
# use java::io::FileFilter;
# use java::io::FilenameFilter;
# use java::io::IOException;
# use java::net::URI;
use org::allbinary::TsUtil;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::io::file::AbFileInterface;

1;

