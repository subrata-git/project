ec2_instance { 'Puppet-Client-1':
  ensure            => present,
  region            => 'us-west-2',
  availability_zone => 'us-west-2c',
  subnet            => 'public_subnet',
  image_id          => 'ami-835b4efa',
  instance_type     => 't2.micro',
  monitoring        => false,
  key_name          => 'peerkey',
  iam_instance_profile_name	=> 'S3_Access',
  security_groups   => ['mysec'],
  user_data         => template('/home/ubuntu/setup.sh'),
  tags              => {
    tag_name => 'test',
  },
}

