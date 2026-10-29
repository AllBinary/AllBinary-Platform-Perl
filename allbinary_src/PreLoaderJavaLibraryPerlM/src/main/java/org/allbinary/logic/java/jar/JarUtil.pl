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

package org::allbinary::logic::java::jar::JarUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{jarURL} = undef;
}


sub new {
    my ($class, $jarURL) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{jarURL} = $jarURL;
    return $self;
}


sub show {
    my ($self) = @_;
        my $cache = [(0) x (1024)];
        try {
            my $conn = $self->{jarURL}->openConnection();
            my $jis = 'java::util::jar::JarInputStream'->new($conn->getInputStream());
            while (1) {
                my $entry = $jis->getNextJarEntry();
                if (defined($entry)) {
                    if (!$entry->isDirectory()) {
                        my $offset = 0;
                        my $i = 0;
                        while ((($i = $jis->read($cache, $offset, scalar(@{$cache}) - $offset))) != -1) {
                            $offset += $i;
                            if ($offset >= scalar(@{$cache})) {
                                my $newcache = [(0) x (scalar(@{$cache}) + 1024)];
                                @{$newcache}[0 .. 0 + scalar(@{$cache}) - 1] = @{$cache}[0 .. 0 + scalar(@{$cache}) - 1];
                                $cache = $newcache;
                            }
                        }
                        my $tmp = [(0) x ($offset)];
                        @{$tmp}[0 .. 0 + $offset - 1] = @{$cache}[0 .. 0 + $offset - 1];
                        print($entry->getName(), "\n");
                    }
                } else {
                    last;
                }
            }
        } catch ($ex) {
            print(STDERR $ex, "\n");
            print(STDERR $ex, "\n");
        }
}


# throws Exception
sub main {
    my ($class, $args) = @_;
        'org::allbinary::logic::java::jar::JarUtil'->new('java::net::URL'->new("file:///G:/mnt/bc/mydev/working/j2me/MiniSpaceWars/MiniSpaceWars/dist/MiniSpaceWars.jar"))->show();
}

# use java::io::IOException;
# use java::net::URL;
# use java::net::URLConnection;
# use java::util::jar::JarEntry;
# use java::util::jar::JarInputStream;
use java::lang::System;

1;

