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

package org::allbinary::logic::communication::ftp::configuration::FtpConfigurationData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NAME = "FTP_NAME";
our $SERVER = "FTP_SERVER";
our $PATH = "FTP_PATH";
our $USERNAME = "FTP_USERNAME";
our $PASSWORD = "FTP_PASSWORD";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


1;

