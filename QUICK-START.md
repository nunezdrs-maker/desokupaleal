# 🚀 Quick Start: Deploy to Fly.io

This guide will get your application deployed to Fly.io in just a few minutes.

## Prerequisites

- ✅ Repository is ready (all setup complete!)
- ✅ Build passes (verified)
- ✅ No security vulnerabilities
- 📋 You need: Fly.io account

## 5-Minute Deployment

### Step 1: Get Fly.io API Token

```bash
# Install Fly CLI (if not installed)
brew install flyctl  # macOS
# or
curl -L https://fly.io/install.sh | sh  # Linux

# Login
fly auth login

# Get token
fly auth token
```

Copy the token that appears.

### Step 2: Add Token to GitHub

1. Go to: https://github.com/nunezdrs-maker/desokupaleal/settings/secrets/actions
2. Click **"New repository secret"**
3. Name: `FLY_API_TOKEN`
4. Value: *paste the token from Step 1*
5. Click **"Add secret"**

### Step 3: Deploy!

**Option A: Automatic (via GitHub Actions)**
```bash
# Just push to main branch
git push origin main
```
- Monitor progress: GitHub → Actions tab
- Wait ~3-5 minutes for first deployment

**Option B: Manual**
```bash
fly deploy
```

### Step 4: Verify

```bash
# Open in browser
fly open

# Or visit directly
# https://desokupaleal.fly.dev

# Check logs
fly logs
```

## 🎯 You're Done!

Your application is now:
- ✅ Live on Fly.io
- ✅ Served via HTTPS (automatic SSL)
- ✅ Auto-deployed on every push to main
- ✅ Auto-scaling based on traffic

## Common Commands

```bash
# View deployment status
fly status

# View logs in real-time
fly logs

# Scale up/down
fly scale count 2  # 2 instances

# SSH into machine
fly ssh console

# View secrets
fly secrets list

# Update secrets
fly secrets set KEY=value
```

## Environment Variables

If your app needs environment variables:

```bash
fly secrets set SUPABASE_URL="https://xxx.supabase.co"
fly secrets set SUPABASE_ANON_KEY="eyJ..."
# Add more as needed
```

## Troubleshooting

### Deployment fails?
```bash
# Check logs
fly logs

# Rebuild locally first
npm run build

# Try manual deploy
fly deploy
```

### App not starting?
```bash
# Check if app is running
fly status

# Check health checks
fly checks list

# Restart
fly apps restart desokupaleal
```

### Need to rollback?
```bash
# See previous releases
fly releases

# Rollback to specific version
fly releases rollback v123
```

## Cost

Fly.io free tier includes:
- 3 shared-cpu-1x VMs
- 256MB RAM per VM
- 160GB bandwidth/month
- Free SSL certificates

This app should run comfortably in the free tier.

## Next Steps

- [ ] Set up custom domain (optional)
- [ ] Configure monitoring (optional)
- [ ] Set up staging environment (optional)

## Support

- 📖 [Fly.io Docs](https://fly.io/docs/)
- 💬 [Fly.io Community](https://community.fly.io/)
- 📊 [Status Page](https://status.flyio.net/)

---

**Ready?** Add the GitHub secret and push to deploy! 🚀
