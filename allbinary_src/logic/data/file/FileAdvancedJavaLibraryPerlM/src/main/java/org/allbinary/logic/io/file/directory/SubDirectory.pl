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

package org::allbinary::logic::io::file::directory::SubDirectory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::io::file::directory::SubDirectory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{directory} = 'org::allbinary::logic::io::file::directory::Directory'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::directory::SubDirectory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub search_j2_1 {
    my ($self, $fileFilter, $file) = @_;
        return $self->{directory}->search($fileFilter, $file, 1);
}


sub search_j1 {
    my ($self, $file) = @_;
        return $self->{directory}->search($file, 1);
}


sub search_j2_2 {
    my ($self, $searchValue, $file) = @_;
        return $self->{directory}->search($searchValue, $file, 1);
}


sub search_j2_3 {
    my ($self, $level, $file) = @_;
        return $self->{directory}->search($level, $file, 1);
}

sub search {
    my ($invocant, @arguments) = @_;
    return $invocant->search_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->search_j1(@arguments) if scalar(@arguments) == 1;
    die "No method search takes " . scalar(@arguments) . " arguments";
}

sub search_j2 {
    my ($invocant, @arguments) = @_;
    return $invocant->search_j2_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY'));
    return $invocant->search_j2_2(@arguments) if 1 && !ref($arguments[0]) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY'));
    return $invocant->search_j2_3(@arguments);
}


sub toString {
    my ($class, $files) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $NEW_LINE = 'org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE};
        my $size = $files->size();
        for (my $index = 0; $index < $size; $index++) {
            my $file = $files->get($index);
            $stringBuffer->append($file->getPath());
            $stringBuffer->append($NEW_LINE);
        }
        return $stringBuffer->toString();
}

use java::lang::Object ();
use java::lang::LazyStatic ();
# use java::io::FileFilter ();
use org::allbinary::logic::io::file::AbFile ();
use org::allbinary::logic::string::StringMaker ();
use org::allbinary::string::CommonSeps ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::logic::io::file::directory::Directory ();

1;

