$file = "c:\00_MDAB\Content Flow\Dashboard_V2_0.html"
$lines = [System.IO.File]::ReadAllLines($file, [System.Text.Encoding]::UTF8)

# ─── CSS additions (insert after line 1193) ───────────────────────────────────
$css = @'
  /* SERP Snapshot */
  .yt-serp-snap { padding:14px 24px 0; }
  .yt-serp-head { font-size:11px;font-weight:700;text-transform:uppercase;letter-spacing:.06em;color:var(--text-muted);display:flex;align-items:center;gap:6px;margin-bottom:8px; }
  .yt-serp-list { display:flex;flex-direction:column;border:1px solid var(--border);border-radius:var(--r);overflow:hidden;margin-bottom:12px; }
  .yt-serp-row { display:flex;align-items:center;gap:10px;padding:8px 12px;font-size:12px;border-bottom:1px solid var(--divider);background:var(--surface);cursor:pointer;transition:background .12s; }
  .yt-serp-row:last-child { border-bottom:none; }
  .yt-serp-row:hover { background:var(--surface-2); }
  .yt-serp-rank { width:20px;height:20px;border-radius:50%;background:var(--surface-3);font-size:10px;font-weight:700;color:var(--text-muted);display:flex;align-items:center;justify-content:center;flex-shrink:0; }
  .yt-serp-rank.r1 { background:var(--accent);color:#fff; }
  .yt-serp-thumb { width:56px;height:32px;border-radius:4px;flex-shrink:0;display:flex;align-items:center;justify-content:center;font-size:9px;font-weight:600;color:#fff; }
  .yt-serp-info { flex:1;min-width:0; }
  .yt-serp-title { font-weight:600;color:var(--text);font-size:12.5px;line-height:1.3;white-space:nowrap;overflow:hidden;text-overflow:ellipsis; }
  .yt-serp-chan { font-size:11px;color:var(--text-muted);margin-top:2px; }
  .yt-serp-meta { font-size:11px;color:var(--text-muted);display:flex;gap:8px;align-items:center;flex-shrink:0; }
  /* Creator Authority */
  .yt-authority { display:grid;grid-template-columns:repeat(4,1fr);gap:8px; }
  .yt-auth-box { background:var(--surface-2);border:1px solid var(--border);border-radius:8px;padding:10px 12px; }
  .yt-auth-lbl { font-size:10px;font-weight:700;color:var(--text-muted);text-transform:uppercase;letter-spacing:.05em;margin-bottom:4px; }
  .yt-auth-val { font-size:15px;font-weight:700;color:var(--text); }
  .yt-auth-sub { font-size:11px;color:var(--text-muted);margin-top:2px;line-height:1.3; }
  /* Video Pacing */
  .yt-pacing-bar { display:flex;height:26px;border-radius:6px;overflow:hidden;gap:1px; }
  .yt-pacing-seg { display:flex;align-items:center;justify-content:center;font-size:9.5px;font-weight:700;color:rgba(255,255,255,.9);letter-spacing:.02em;overflow:hidden;white-space:nowrap; }
  .yt-pacing-legend { display:flex;flex-wrap:wrap;gap:8px;margin-top:8px; }
  .yt-pacing-dot { display:flex;align-items:center;gap:4px;font-size:11px;color:var(--text-secondary); }
  /* Beat Rate */
  .yt-beat-grid5 { display:grid;grid-template-columns:repeat(5,1fr);gap:8px;margin-bottom:14px; }
  .yt-beat-card { background:var(--surface-2);border:1px solid var(--border);border-radius:10px;padding:12px 14px;text-align:center; }
  .yt-beat-score { font-size:28px;font-weight:800;font-family:'Instrument Serif',serif;line-height:1; }
  .yt-beat-lbl { font-size:10px;font-weight:700;color:var(--text-muted);text-transform:uppercase;letter-spacing:.05em;margin:4px 0 2px; }
  .yt-beat-chan { font-size:11px;color:var(--text-secondary);margin-bottom:6px; }
  .yt-beat-bar { height:4px;background:var(--surface-3);border-radius:2px;overflow:hidden; }
  .yt-beat-fill { height:100%;border-radius:2px; }
  .yt-beat-overall { display:flex;align-items:center;gap:16px;background:linear-gradient(135deg,rgba(79,70,229,.07),rgba(124,58,237,.04));border:1.5px solid var(--accent-border);border-radius:10px;padding:14px 18px;margin-bottom:14px; }
  .yt-beat-big { font-size:48px;font-weight:900;font-family:'Instrument Serif',serif;line-height:1;color:var(--accent); }
  /* Content Gap Heatmap */
  .yt-heatmap { width:100%;border-collapse:collapse;font-size:11.5px; }
  .yt-heatmap th { font-size:10px;font-weight:700;text-transform:uppercase;letter-spacing:.04em;color:var(--text-muted);padding:7px 8px;text-align:center;border-bottom:1px solid var(--border);background:var(--surface-2); }
  .yt-heatmap th.th-topic { text-align:left;min-width:170px; }
  .yt-heatmap td { padding:6px 8px;text-align:center;border-bottom:1px solid var(--divider); }
  .yt-heatmap tr:last-child td { border-bottom:none; }
  .yt-heatmap td.td-topic { text-align:left;font-size:12px;color:var(--text-secondary); }
  .hm-y { display:inline-block;background:rgba(34,197,94,.15);color:var(--success);font-size:10px;font-weight:700;border-radius:4px;padding:2px 7px; }
  .hm-p { display:inline-block;background:rgba(245,158,11,.12);color:var(--warning);font-size:10px;font-weight:700;border-radius:4px;padding:2px 7px; }
  .hm-n { display:inline-block;background:rgba(220,38,38,.1);color:var(--danger);font-size:10px;font-weight:700;border-radius:4px;padding:2px 7px; }
  .hm-u { display:inline-block;background:rgba(79,70,229,.18);color:var(--accent);font-size:11px;font-weight:800;border-radius:4px;padding:2px 7px; }
  /* Revenue Projection */
  .yt-rev-grid { display:grid;grid-template-columns:1fr 1fr 1fr;gap:10px;margin:10px 0; }
  .yt-rev-card { border-radius:10px;padding:14px 16px; }
  .yt-rev-tier { font-size:10px;font-weight:700;text-transform:uppercase;letter-spacing:.05em;margin-bottom:3px; }
  .yt-rev-amount { font-size:30px;font-weight:800;font-family:'Instrument Serif',serif;line-height:1.1;margin-bottom:4px; }
  .yt-rev-line { font-size:11.5px;color:var(--text-secondary);line-height:1.7; }
  /* Algo Checklist */
  .yt-algo-grid { display:grid;grid-template-columns:1fr 1fr;gap:6px;margin-top:10px; }
  .yt-algo-item { display:flex;align-items:flex-start;gap:8px;font-size:12px;color:var(--text-secondary);padding:7px 10px;background:var(--surface);border:1px solid var(--border);border-radius:7px;line-height:1.4; }
  .yt-algo-dot { width:16px;height:16px;border-radius:4px;background:var(--success);flex-shrink:0;display:flex;align-items:center;justify-content:center;margin-top:1px; }
'@

# ─── SERP Snapshot (insert after line 2047) ───────────────────────────────────
$serp = @'
          <!-- SERP Snapshot — What your viewer sees when they search this keyword -->
          <div class="yt-serp-snap">
            <div class="yt-serp-head">
              <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
              YouTube SERP Snapshot &mdash; &ldquo;best under desk treadmill&rdquo; &nbsp;&middot;&nbsp; 14,800 searches/mo &nbsp;&middot;&nbsp; click any row to open that video&rsquo;s deep analysis
            </div>
            <div class="yt-serp-list">
              <div class="yt-serp-row" onclick="switchYT(1)">
                <div class="yt-serp-rank r1">1</div>
                <div class="yt-serp-thumb" style="background:linear-gradient(135deg,#1a1a2e,#16213e);">&#9654; 14:22</div>
                <div class="yt-serp-info"><div class="yt-serp-title">Best Under Desk Treadmills 2024 &mdash; I Tested 5 Popular Models!</div><div class="yt-serp-chan">TechGadgetReviews &middot; 280K subs &middot; Dec 2023</div></div>
                <div class="yt-serp-meta"><span>3.2M views</span><span class="badge badge-warning" style="font-size:10px;">18+ mo stale</span><span class="yt-eng-badge med">0.57%</span></div>
              </div>
              <div class="yt-serp-row" onclick="switchYT(2)">
                <div class="yt-serp-rank">2</div>
                <div class="yt-serp-thumb" style="background:linear-gradient(135deg,#0f2027,#203a43);">&#9654; 18:45</div>
                <div class="yt-serp-info"><div class="yt-serp-title">I Walked 10,000 Steps a Day at My Desk &mdash; 30-Day Challenge Results</div><div class="yt-serp-chan">GadgetExplorers &middot; 520K subs &middot; Jul 2023</div></div>
                <div class="yt-serp-meta"><span>2.4M views</span><span class="badge badge-danger" style="font-size:10px;">30+ mo stale</span><span class="yt-eng-badge high">1.75%</span></div>
              </div>
              <div class="yt-serp-row" onclick="switchYT(3)">
                <div class="yt-serp-rank">3</div>
                <div class="yt-serp-thumb" style="background:linear-gradient(135deg,#1a1a2e,#16213e);">&#9654; 22:10</div>
                <div class="yt-serp-info"><div class="yt-serp-title">Under Desk Treadmill HONEST Review: 6 Months Later (The Good AND Bad)</div><div class="yt-serp-chan">TechTalkHQ &middot; 410K subs &middot; Sep 2023</div></div>
                <div class="yt-serp-meta"><span>1.8M views</span><span class="badge badge-danger" style="font-size:10px;">28+ mo stale</span><span class="yt-eng-badge high">1.22%</span></div>
              </div>
              <div class="yt-serp-row" onclick="switchYT(4)">
                <div class="yt-serp-rank">4</div>
                <div class="yt-serp-thumb" style="background:linear-gradient(135deg,#0d1b2a,#1b2838);">&#9654; 11:38</div>
                <div class="yt-serp-info"><div class="yt-serp-title">Best Under Desk Treadmill for Standing Desk (3 Models I Actually Tested)</div><div class="yt-serp-chan">WorkSmartDaily &middot; 89K subs &middot; Feb 2024</div></div>
                <div class="yt-serp-meta"><span>890K views</span><span class="badge badge-warning" style="font-size:10px;">15+ mo stale</span><span class="yt-eng-badge high">1.05%</span></div>
              </div>
              <div class="yt-serp-row" onclick="switchYT(5)">
                <div class="yt-serp-rank">5</div>
                <div class="yt-serp-thumb" style="background:linear-gradient(135deg,#1a0a2e,#2d1b69);">&#9654; 9:52</div>
                <div class="yt-serp-info"><div class="yt-serp-title">Best Under Desk Treadmills 2025 &mdash; ONLY 2 Are Worth Your Money</div><div class="yt-serp-chan">FitLifeOffice &middot; 42K subs &middot; Jan 2025</div></div>
                <div class="yt-serp-meta"><span>445K views</span><span class="badge badge-info" style="font-size:10px;">Freshest</span><span class="yt-eng-badge high">1.17%</span></div>
              </div>
            </div>
            <div style="display:flex;align-items:center;gap:16px;font-size:11.5px;padding-bottom:4px;">
              <span style="color:var(--text-muted);">8.735M total SERP views</span>
              <span style="color:var(--danger);font-weight:600;">&#9873; 4 of 5 results are 12&ndash;30 months old &mdash; publish now to capture the freshness gap</span>
            </div>
          </div>
'@

# ─── Creator Authority P1 (insert after line 2180) ────────────────────────────
$authP1 = @'
            <div class="csec">
              <div class="csec-label">Creator Authority Profile</div>
              <div class="csec-body">
                <div class="yt-authority">
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Channel Age</div><div class="yt-auth-val">~8 yrs</div><div class="yt-auth-sub">Est. 2016 &middot; Active</div></div>
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Upload Freq.</div><div class="yt-auth-val">~2/mo</div><div class="yt-auth-sub">Consistent publisher</div></div>
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Niche Authority</div><div class="yt-auth-val" style="color:var(--warning);">General</div><div class="yt-auth-sub">Tech gadgets &mdash; not desk/fitness</div></div>
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Topic Depth</div><div class="yt-auth-val" style="color:var(--warning);">2 vids</div><div class="yt-auth-sub">One-off coverage</div></div>
                </div>
                <div style="margin-top:8px;font-size:12px;color:var(--text-secondary);padding:8px 12px;background:var(--success-soft);border:1px solid var(--success-border);border-radius:8px;"><strong style="color:var(--success);">Beatability:</strong> General tech channel, not a standing desk authority. Their treadmill content is a one-off with no cluster. A dedicated niche creator establishes stronger topical authority &mdash; <strong style="color:var(--success);">low long-term threat.</strong></div>
              </div>
            </div>
'@

# ─── Video Pacing P1 (insert after line 2252) ─────────────────────────────────
$paceP1 = @'
            <div class="csec">
              <div class="csec-label">Video Pacing Map &mdash; Structure Timeline (14:22 total)</div>
              <div class="csec-body">
                <div class="yt-pacing-bar">
                  <div class="yt-pacing-seg" style="flex:6;background:#6366f1;">Hook</div>
                  <div class="yt-pacing-seg" style="flex:11;background:#8b5cf6;">Method</div>
                  <div class="yt-pacing-seg" style="flex:65;background:#f59e0b;">Reviews #5&rarr;#2</div>
                  <div class="yt-pacing-seg" style="flex:13;background:#10b981;">#1 Pick</div>
                  <div class="yt-pacing-seg" style="flex:5;background:#ef4444;">CTA</div>
                </div>
                <div class="yt-pacing-legend">
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#6366f1;margin-right:3px;"></span>Hook 0:00&ndash;0:45 (5%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#8b5cf6;margin-right:3px;"></span>Methodology 0:45&ndash;2:10 (10%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#f59e0b;margin-right:3px;"></span>Product reviews #5&rarr;#2 &nbsp;2:10&ndash;11:30 (65%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#10b981;margin-right:3px;"></span>Hero pick #1 &nbsp;11:30&ndash;13:40 (15%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#ef4444;margin-right:3px;"></span>CTA/outro &nbsp;13:40&ndash;14:22 (5%)</div>
                </div>
                <div style="display:grid;grid-template-columns:1fr 1fr;gap:8px;margin-top:8px;">
                  <div style="font-size:12px;color:var(--text-secondary);padding:8px 10px;background:var(--warning-soft);border:1px solid var(--warning-border);border-radius:7px;"><strong style="color:var(--warning);">&#9888; Drop-off risk:</strong> Best pick revealed at 80% through. Viewers who leave at 60% never see the #1 recommendation &mdash; the highest-commission product.</div>
                  <div style="font-size:12px;color:var(--text-secondary);padding:8px 10px;background:var(--success-soft);border:1px solid var(--success-border);border-radius:7px;"><strong style="color:var(--success);">Your move:</strong> Preview your winner at 0:30 sec (&ldquo;my #1 might surprise you &mdash; stay for the data&rdquo;) &mdash; higher average view duration, same affiliate payoff.</div>
                </div>
              </div>
            </div>
'@

# ─── Creator Authority P2 (insert after line 2452) ────────────────────────────
$authP2 = @'
            <div class="csec"><div class="csec-label">Creator Authority Profile</div>
              <div class="csec-body">
                <div class="yt-authority">
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Channel Age</div><div class="yt-auth-val">~9 yrs</div><div class="yt-auth-sub">Est. 2015 &middot; Active</div></div>
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Upload Freq.</div><div class="yt-auth-val">~3/mo</div><div class="yt-auth-sub">High-frequency publisher</div></div>
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Niche Authority</div><div class="yt-auth-val" style="color:var(--warning);">Mixed</div><div class="yt-auth-sub">Tech + lifestyle blend</div></div>
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Topic Depth</div><div class="yt-auth-val" style="color:var(--warning);">1 vid</div><div class="yt-auth-sub">Single treadmill video</div></div>
                </div>
                <div style="margin-top:8px;font-size:12px;color:var(--text-secondary);padding:8px 12px;background:var(--info-soft);border:1px solid var(--info-border);border-radius:8px;"><strong style="color:var(--info);">Key signal:</strong> 520K subs but this is their ONLY treadmill video. High engagement (1.75%) is driven by the challenge/journey format &mdash; not product authority. <strong style="color:var(--success);">Beatable with a multi-product comparison structure.</strong></div>
              </div>
            </div>
'@

# ─── Video Pacing P2 (insert after line 2489) ─────────────────────────────────
$paceP2 = @'
            <div class="csec"><div class="csec-label">Video Pacing Map &mdash; Structure Timeline (18:45 total)</div>
              <div class="csec-body">
                <div class="yt-pacing-bar">
                  <div class="yt-pacing-seg" style="flex:8;background:#6366f1;">Hook</div>
                  <div class="yt-pacing-seg" style="flex:12;background:#8b5cf6;">Setup</div>
                  <div class="yt-pacing-seg" style="flex:54;background:#0ea5e9;">Journey diary</div>
                  <div class="yt-pacing-seg" style="flex:18;background:#10b981;">Results reveal</div>
                  <div class="yt-pacing-seg" style="flex:8;background:#ef4444;">CTA</div>
                </div>
                <div class="yt-pacing-legend">
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#6366f1;margin-right:3px;"></span>Hook 0:00&ndash;1:30 (8%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#8b5cf6;margin-right:3px;"></span>WalkingPad setup 1:30&ndash;3:45 (12%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#0ea5e9;margin-right:3px;"></span>Day-by-day journey 3:45&ndash;11:00 (54%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#10b981;margin-right:3px;"></span>30-day results reveal 11:00&ndash;16:30 (18%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#ef4444;margin-right:3px;"></span>CTA/GoPlus alt 16:30&ndash;18:45 (12%)</div>
                </div>
                <div style="margin-top:8px;font-size:12px;color:var(--text-secondary);padding:8px 10px;background:var(--info-soft);border:1px solid var(--info-border);border-radius:7px;"><strong style="color:var(--info);">Why 1.75% engagement:</strong> Narrative arc (day 1 &rarr; day 30 reveal) creates episodic viewer investment. Buyer-intent searchers likely drop off before finding a product rec &mdash; explaining high views but lower affiliate conversion vs. a listicle format.</div>
              </div>
            </div>
'@

# ─── Creator Authority P3 (insert after line 2568) ────────────────────────────
$authP3 = @'
            <div class="csec"><div class="csec-label">Creator Authority Profile</div>
              <div class="csec-body">
                <div class="yt-authority">
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Channel Age</div><div class="yt-auth-val">~7 yrs</div><div class="yt-auth-sub">Est. 2017 &middot; Active</div></div>
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Upload Freq.</div><div class="yt-auth-val">~2/mo</div><div class="yt-auth-sub">Consistent publisher</div></div>
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Niche Authority</div><div class="yt-auth-val" style="color:var(--warning);">Semi-niche</div><div class="yt-auth-sub">Tech-focused lifestyle</div></div>
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Topic Depth</div><div class="yt-auth-val" style="color:var(--success);">3 vids</div><div class="yt-auth-sub">Small cluster, not dominant</div></div>
                </div>
                <div style="margin-top:8px;font-size:12px;color:var(--text-secondary);padding:8px 12px;background:var(--warning-soft);border:1px solid var(--warning-border);border-radius:8px;"><strong style="color:var(--warning);">Moderate threat:</strong> 3 videos on the topic cluster + 410K subs + consistent uploads. However, single-product focus means a comprehensive comparison from you covers ground they never will.</div>
              </div>
            </div>
'@

# ─── Video Pacing P3 (insert after line 2598) ─────────────────────────────────
$paceP3 = @'
            <div class="csec"><div class="csec-label">Video Pacing Map &mdash; Structure Timeline (22:10 total)</div>
              <div class="csec-body">
                <div class="yt-pacing-bar">
                  <div class="yt-pacing-seg" style="flex:9;background:#6366f1;">Hook</div>
                  <div class="yt-pacing-seg" style="flex:15;background:#8b5cf6;">Unbox</div>
                  <div class="yt-pacing-seg" style="flex:33;background:#0ea5e9;">First weeks</div>
                  <div class="yt-pacing-seg" style="flex:23;background:#f59e0b;">Long-term</div>
                  <div class="yt-pacing-seg" style="flex:17;background:#10b981;">Verdict</div>
                  <div class="yt-pacing-seg" style="flex:3;background:#ef4444;">CTA</div>
                </div>
                <div class="yt-pacing-legend">
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#6366f1;margin-right:3px;"></span>Hook 0:00&ndash;2:00 (9%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#8b5cf6;margin-right:3px;"></span>Unboxing/setup 2:00&ndash;5:30 (16%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#0ea5e9;margin-right:3px;"></span>First weeks 5:30&ndash;12:45 (33%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#f59e0b;margin-right:3px;"></span>Months 4&ndash;6 belt/repair 12:45&ndash;18:00 (24%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#10b981;margin-right:3px;"></span>Verdict 18:00&ndash;22:10 (19%)</div>
                </div>
                <div style="margin-top:8px;font-size:12px;color:var(--text-secondary);padding:8px 10px;background:var(--success-soft);border:1px solid var(--success-border);border-radius:7px;"><strong style="color:var(--success);">Steal this pattern:</strong> The long-term durability section (12:45&ndash;18:00) is the most unique content &mdash; front-load a tease of your 3-month finding: &ldquo;At 12 minutes I&rsquo;ll show you what happens to the belt after 500 miles.&rdquo;</div>
              </div>
            </div>
'@

# ─── Creator Authority P4 (insert after line 2677) ────────────────────────────
$authP4 = @'
            <div class="csec"><div class="csec-label">Creator Authority Profile</div>
              <div class="csec-body">
                <div class="yt-authority">
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Channel Age</div><div class="yt-auth-val">~5 yrs</div><div class="yt-auth-sub">Est. 2019 &middot; Active</div></div>
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Upload Freq.</div><div class="yt-auth-val">~1/mo</div><div class="yt-auth-sub">Moderate publisher</div></div>
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Niche Authority</div><div class="yt-auth-val" style="color:var(--success);">Niche</div><div class="yt-auth-sub">WFH productivity focus</div></div>
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Topic Depth</div><div class="yt-auth-val" style="color:var(--warning);">2 vids</div><div class="yt-auth-sub">Standing desk + treadmill</div></div>
                </div>
                <div style="margin-top:8px;font-size:12px;color:var(--text-secondary);padding:8px 12px;background:var(--success-soft);border:1px solid var(--success-border);border-radius:8px;"><strong style="color:var(--success);">Easiest to beat of the 5:</strong> 89K subs yet 890K views proves the niche angle works. Match their niche targeting + add noise data, budget options, 2025 models they can&rsquo;t cover without re-filming.</div>
              </div>
            </div>
'@

# ─── Video Pacing P4 (insert after line 2706) ─────────────────────────────────
$paceP4 = @'
            <div class="csec"><div class="csec-label">Video Pacing Map &mdash; Structure Timeline (11:38 total)</div>
              <div class="csec-body">
                <div class="yt-pacing-bar">
                  <div class="yt-pacing-seg" style="flex:15;background:#6366f1;">Hook + criteria</div>
                  <div class="yt-pacing-seg" style="flex:72;background:#f59e0b;">3 Model reviews</div>
                  <div class="yt-pacing-seg" style="flex:9;background:#10b981;">Clearance table</div>
                  <div class="yt-pacing-seg" style="flex:4;background:#ef4444;">CTA</div>
                </div>
                <div class="yt-pacing-legend">
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#6366f1;margin-right:3px;"></span>Hook + buying criteria 0:00&ndash;1:45 (15%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#f59e0b;margin-right:3px;"></span>3 model reviews 1:45&ndash;10:30 (72%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#10b981;margin-right:3px;"></span>Desk clearance summary table 10:30&ndash;11:08 (9%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#ef4444;margin-right:3px;"></span>CTA 11:08&ndash;11:38 (4%)</div>
                </div>
                <div style="margin-top:8px;font-size:12px;color:var(--text-secondary);padding:8px 10px;background:var(--info-soft);border:1px solid var(--info-border);border-radius:7px;"><strong style="color:var(--info);">Structural insight:</strong> 72% of runtime is product reviews yet no noise data. 11:38 is too short to earn the &ldquo;I actually tested&rdquo; credibility. Your 18&ndash;22 min version with dB measurements and clearance table will dominate this position.</div>
              </div>
            </div>
'@

# ─── Creator Authority P5 (insert after line 2785) ────────────────────────────
$authP5 = @'
            <div class="csec"><div class="csec-label">Creator Authority Profile</div>
              <div class="csec-body">
                <div class="yt-authority">
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Channel Age</div><div class="yt-auth-val">~3 yrs</div><div class="yt-auth-sub">Est. 2022 &middot; Growing</div></div>
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Upload Freq.</div><div class="yt-auth-val">~2/mo</div><div class="yt-auth-sub">Consistent publisher</div></div>
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Niche Authority</div><div class="yt-auth-val" style="color:var(--success);">Niche</div><div class="yt-auth-sub">Home office fitness</div></div>
                  <div class="yt-auth-box"><div class="yt-auth-lbl">Topic Depth</div><div class="yt-auth-val" style="color:var(--warning);">3 vids</div><div class="yt-auth-sub">Small but growing cluster</div></div>
                </div>
                <div style="margin-top:8px;font-size:12px;color:var(--text-secondary);padding:8px 12px;background:var(--danger-soft);border:1px solid var(--danger-border);border-radius:8px;"><strong style="color:var(--danger);">Only threat in the set:</strong> Jan 2025 = no freshness gap. However 42K subs + 9:52 runtime is a weak position. A longer, data-rich video from a more authoritative channel will outrank them. Watch for their 2026 update given strong engagement.</div>
              </div>
            </div>
'@

# ─── Video Pacing P5 (insert after line 2814) ─────────────────────────────────
$paceP5 = @'
            <div class="csec"><div class="csec-label">Video Pacing Map &mdash; Structure Timeline (9:52 total)</div>
              <div class="csec-body">
                <div class="yt-pacing-bar">
                  <div class="yt-pacing-seg" style="flex:13;background:#6366f1;">Hook</div>
                  <div class="yt-pacing-seg" style="flex:17;background:#8b5cf6;">Why most fail</div>
                  <div class="yt-pacing-seg" style="flex:33;background:#f59e0b;">Winner #2</div>
                  <div class="yt-pacing-seg" style="flex:30;background:#10b981;">Winner #1</div>
                  <div class="yt-pacing-seg" style="flex:7;background:#ef4444;">CTA</div>
                </div>
                <div class="yt-pacing-legend">
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#6366f1;margin-right:3px;"></span>Hook 0:00&ndash;1:20 (13%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#8b5cf6;margin-right:3px;"></span>&ldquo;Why most fail&rdquo; elimination 1:20&ndash;3:00 (17%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#f59e0b;margin-right:3px;"></span>WalkingPad A1 Pro review 3:00&ndash;6:15 (33%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#10b981;margin-right:3px;"></span>Lifespan #1 review 6:15&ndash;9:10 (30%)</div>
                  <div class="yt-pacing-dot"><span style="display:inline-block;width:8px;height:8px;border-radius:2px;background:#ef4444;margin-right:3px;"></span>CTA 9:10&ndash;9:52 (7%)</div>
                </div>
                <div style="margin-top:8px;font-size:12px;color:var(--text-secondary);padding:8px 10px;background:var(--warning-soft);border:1px solid var(--warning-border);border-radius:7px;"><strong style="color:var(--warning);">Structural gap:</strong> No budget option, no clearance data, no noise test &mdash; all crammed into 9:52. The &ldquo;elimination&rdquo; approach (1:20&ndash;3:00) is smart &mdash; borrow it. Comments prove viewers want MORE depth. Your 20-min version with real data will dominate.</div>
              </div>
            </div>
'@

# ─── Synthesis additions (insert after line 2903) ─────────────────────────────
$synthesis = @'

            <!-- Beat Rate / Winnability Score -->
            <div class="csec" style="background:linear-gradient(135deg,rgba(79,70,229,.04),rgba(124,58,237,.02));border-left-color:var(--accent);margin-top:14px;">
              <div class="csec-label" style="color:var(--accent);">
                <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                Beat Rate &mdash; Winnability Score Per Competitor
              </div>
              <div class="csec-body">
                <div class="yt-beat-overall">
                  <div class="yt-beat-big">78%</div>
                  <div>
                    <div style="font-size:15px;font-weight:700;color:var(--text);margin-bottom:4px;">Strong Opportunity &mdash; Publish Now</div>
                    <div style="font-size:12.5px;color:var(--text-secondary);line-height:1.6;">Freshness gap (4/5 stale) + universal content gaps (noise test, desk clearance, 2025 models) give you an outsized first-mover advantage. The competitive landscape has major holes you can fill TODAY.</div>
                    <div style="font-size:11px;color:var(--text-muted);margin-top:5px;">Score algorithm: Freshness (35%) + Content Gap (30%) + Quality Match (20%) + Channel Authority (15%)</div>
                  </div>
                </div>
                <div class="yt-beat-grid5">
                  <div class="yt-beat-card"><div class="yt-beat-score" style="color:#f59e0b;">78%</div><div class="yt-beat-lbl">V1</div><div class="yt-beat-chan">TechGadgetReviews</div><div class="yt-beat-bar"><div class="yt-beat-fill" style="width:78%;background:#f59e0b;"></div></div><div style="font-size:10.5px;color:var(--text-muted);margin-top:6px;line-height:1.4;">18+ mo stale &middot; General channel &middot; 0.57% eng.</div></div>
                  <div class="yt-beat-card"><div class="yt-beat-score" style="color:#f59e0b;">74%</div><div class="yt-beat-lbl">V2</div><div class="yt-beat-chan">GadgetExplorers</div><div class="yt-beat-bar"><div class="yt-beat-fill" style="width:74%;background:#f59e0b;"></div></div><div style="font-size:10.5px;color:var(--text-muted);margin-top:6px;line-height:1.4;">30+ mo stale &middot; Single product only</div></div>
                  <div class="yt-beat-card"><div class="yt-beat-score" style="color:#f59e0b;">76%</div><div class="yt-beat-lbl">V3</div><div class="yt-beat-chan">TechTalkHQ</div><div class="yt-beat-bar"><div class="yt-beat-fill" style="width:76%;background:#f59e0b;"></div></div><div style="font-size:10.5px;color:var(--text-muted);margin-top:6px;line-height:1.4;">28+ mo stale &middot; Single product &middot; no data</div></div>
                  <div class="yt-beat-card"><div class="yt-beat-score" style="color:var(--success);">83%</div><div class="yt-beat-lbl">V4</div><div class="yt-beat-chan">WorkSmartDaily</div><div class="yt-beat-bar"><div class="yt-beat-fill" style="width:83%;background:var(--success);"></div></div><div style="font-size:10.5px;color:var(--text-muted);margin-top:6px;line-height:1.4;">89K subs &middot; No noise test &middot; 3 models only</div></div>
                  <div class="yt-beat-card"><div class="yt-beat-score" style="color:var(--success);">80%</div><div class="yt-beat-lbl">V5</div><div class="yt-beat-chan">FitLifeOffice</div><div class="yt-beat-bar"><div class="yt-beat-fill" style="width:80%;background:var(--success);"></div></div><div style="font-size:10.5px;color:var(--text-muted);margin-top:6px;line-height:1.4;">42K subs &middot; 9:52 too short &middot; no measurements</div></div>
                </div>
              </div>
            </div>

            <!-- Content Gap Heatmap -->
            <div class="csec" style="margin-top:14px;">
              <div class="csec-label">Content Gap Heatmap &mdash; All 5 Videos vs. Your Target Video</div>
              <div class="csec-body">
                <div style="overflow-x:auto;">
                  <table class="yt-heatmap">
                    <thead>
                      <tr>
                        <th class="th-topic">Topic / Feature</th>
                        <th>V1<br><span style="font-weight:400;font-size:9px;">TechGadget</span></th>
                        <th>V2<br><span style="font-weight:400;font-size:9px;">GadgetExp</span></th>
                        <th>V3<br><span style="font-weight:400;font-size:9px;">TechTalkHQ</span></th>
                        <th>V4<br><span style="font-weight:400;font-size:9px;">WorkSmart</span></th>
                        <th>V5<br><span style="font-weight:400;font-size:9px;">FitLife</span></th>
                        <th>YOU<br><span style="font-weight:400;font-size:9px;">Target</span></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr><td class="td-topic"><strong>Noise test (actual dB reading)</strong></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-u">&#10003; You</span></td></tr>
                      <tr><td class="td-topic"><strong>Desk clearance measurements</strong></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-p">&#8776; Partial</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-u">&#10003; You</span></td></tr>
                      <tr><td class="td-topic"><strong>2025 new models (E700, X21)</strong></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-p">&#8776; Partial</span></td><td><span class="hm-u">&#10003; You</span></td></tr>
                      <tr><td class="td-topic">App / Bluetooth reliability test</td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-u">&#10003; You</span></td></tr>
                      <tr><td class="td-topic">Assembly time + difficulty score</td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-p">&#8776; Partial</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-u">&#10003; You</span></td></tr>
                      <tr><td class="td-topic">Floor mat guidance</td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-u">&#10003; You</span></td></tr>
                      <tr><td class="td-topic">Long-term durability (3+ months)</td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-y">&#10003; Yes</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-u">&#10003; You</span></td></tr>
                      <tr><td class="td-topic">Budget option under $300</td><td><span class="hm-y">&#10003; Yes</span></td><td><span class="hm-p">&#8776; Partial</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-y">&#10003; Yes</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-u">&#10003; You</span></td></tr>
                      <tr><td class="td-topic">5+ products compared</td><td><span class="hm-y">&#10003; 5</span></td><td><span class="hm-n">&#10007; 2</span></td><td><span class="hm-n">&#10007; 1</span></td><td><span class="hm-p">&#8776; 3</span></td><td><span class="hm-n">&#10007; 2</span></td><td><span class="hm-u">&#10003; 7+</span></td></tr>
                      <tr><td class="td-topic">Current 2025&ndash;26 pricing</td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-n">&#10007; No</span></td><td><span class="hm-p">&#8776; Partial</span></td><td><span class="hm-u">&#10003; You</span></td></tr>
                    </tbody>
                  </table>
                </div>
                <div style="margin-top:8px;font-size:11.5px;color:var(--text-muted);display:flex;gap:14px;flex-wrap:wrap;">
                  <span><span class="hm-u">YOU</span> = your target video &nbsp;</span>
                  <span><span class="hm-y">&#10003; Yes</span> = fully covered &nbsp;</span>
                  <span><span class="hm-p">&#8776; Partial</span> = mentioned, incomplete &nbsp;</span>
                  <span><span class="hm-n">&#10007; No</span> = completely missing</span>
                </div>
              </div>
            </div>

            <!-- Revenue Potential Projection -->
            <div class="csec" style="margin-top:14px;">
              <div class="csec-label">
                <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="1" x2="12" y2="23"></line><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path></svg>
                Revenue Potential &mdash; If You Rank #1 (14,800 searches/mo)
              </div>
              <div class="csec-body">
                <div class="yt-rev-grid">
                  <div class="yt-rev-card" style="background:rgba(239,68,68,.05);border:1.5px solid rgba(239,68,68,.2);">
                    <div class="yt-rev-tier" style="color:var(--danger);">Conservative</div>
                    <div class="yt-rev-amount" style="color:var(--danger);">$1,350/mo</div>
                    <div class="yt-rev-line">25K views &rarr; 500 affiliate clicks (2%)<br>25 sales (5% conv.) &times; avg. $54 comm.<br>Payback period: ~2 months</div>
                  </div>
                  <div class="yt-rev-card" style="background:rgba(79,70,229,.06);border:1.5px solid var(--accent-border);">
                    <div class="yt-rev-tier" style="color:var(--accent);">Expected</div>
                    <div class="yt-rev-amount" style="color:var(--accent);">$2,970/mo</div>
                    <div class="yt-rev-line">55K views &rarr; 1,100 affiliate clicks (2%)<br>55 sales (5% conv.) &times; avg. $54 comm.<br>Payback period: ~1 month</div>
                  </div>
                  <div class="yt-rev-card" style="background:rgba(34,197,94,.06);border:1.5px solid rgba(34,197,94,.25);">
                    <div class="yt-rev-tier" style="color:var(--success);">Best Case</div>
                    <div class="yt-rev-amount" style="color:var(--success);">$4,860/mo</div>
                    <div class="yt-rev-line">90K views &rarr; 1,800 affiliate clicks (2%)<br>90 sales (5% conv.) &times; avg. $54 comm.<br>Payback period: &lt;1 month</div>
                  </div>
                </div>
                <div style="font-size:11.5px;color:var(--text-muted);padding:4px 2px;">Assumptions: avg. commission $54 (Lifespan $42 + WalkingPad $30 + GoPlus $8, weighted by sales mix) &middot; 2% link CTR &middot; 5% conversion &middot; VidIQ view estimates for top position at 14,800 monthly searches.</div>
              </div>
            </div>

            <!-- Algorithm Optimization Cheat Sheet -->
            <div class="csec" style="margin-top:14px;background:linear-gradient(135deg,rgba(79,70,229,.04),rgba(79,70,229,.01));border-left-color:var(--accent);">
              <div class="csec-label" style="color:var(--accent);">
                <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                Algorithm Optimization Cheat Sheet &mdash; Synthesized from All 5 Competitor Videos
              </div>
              <div class="csec-body">
                <div class="yt-algo-grid">
                  <div class="yt-algo-item"><div class="yt-algo-dot"><svg width="9" height="9" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="3.5"><polyline points="20 6 9 17 4 12"></polyline></svg></div><div><strong>Title formula:</strong> Lead with primary KW + year + &ldquo;I Tested&rdquo; signal + number + data proof. Pattern: &ldquo;I Tested [N] Under Desk Treadmills for [30 Days] &mdash; 2025 (Noise + Desk Fit Data)&rdquo;</div></div>
                  <div class="yt-algo-item"><div class="yt-algo-dot"><svg width="9" height="9" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="3.5"><polyline points="20 6 9 17 4 12"></polyline></svg></div><div><strong>Thumbnail:</strong> Face (confident expression) + 2&ndash;3 products + high-contrast text &le;3 words + year badge. Mirror V1 layout + &ldquo;2025 data&rdquo; callout for freshness signal.</div></div>
                  <div class="yt-algo-item"><div class="yt-algo-dot"><svg width="9" height="9" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="3.5"><polyline points="20 6 9 17 4 12"></polyline></svg></div><div><strong>Hook (first 15 sec):</strong> Open with a specific measurement. &ldquo;I measured 67 decibels on Zoom&rdquo; beats every competitor hook instantly. Tease your #1 pick within 30 seconds.</div></div>
                  <div class="yt-algo-item"><div class="yt-algo-dot"><svg width="9" height="9" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="3.5"><polyline points="20 6 9 17 4 12"></polyline></svg></div><div><strong>Duration target:</strong> 18&ndash;22 minutes. V2 (18:45, 1.75% eng.) and V3 (22:10, 1.22%) prove long-form dominates for this keyword. V5&rsquo;s 9:52 underperforms on depth and comment satisfaction.</div></div>
                  <div class="yt-algo-item"><div class="yt-algo-dot"><svg width="9" height="9" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="3.5"><polyline points="20 6 9 17 4 12"></polyline></svg></div><div><strong>Description:</strong> 3 affiliate links above the fold (before &ldquo;show more&rdquo;). Chapters in description. FTC disclosure on line 1. Primary keyword in first 2 sentences. Copy V1&rsquo;s exact format.</div></div>
                  <div class="yt-algo-item"><div class="yt-algo-dot"><svg width="9" height="9" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="3.5"><polyline points="20 6 9 17 4 12"></polyline></svg></div><div><strong>Must-include tags:</strong> &ldquo;best under desk treadmill&rdquo; &middot; &ldquo;under desk treadmill 2025&rdquo; &middot; &ldquo;walking pad review&rdquo; &middot; &ldquo;treadmill desk&rdquo; &middot; &ldquo;walking while working&rdquo; &middot; &ldquo;under desk treadmill noise test&rdquo; &middot; &ldquo;under desk treadmill standing desk&rdquo; &middot; &ldquo;walkingpad a1 pro&rdquo;</div></div>
                  <div class="yt-algo-item"><div class="yt-algo-dot"><svg width="9" height="9" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="3.5"><polyline points="20 6 9 17 4 12"></polyline></svg></div><div><strong>Chapter structure:</strong> Hook &rarr; Why most videos get it wrong &rarr; My testing methodology (dB + tape measure) &rarr; Rankings #7&rarr;#1 &rarr; Desk clearance table &rarr; Noise test comparison &rarr; Buyer guide by budget &rarr; Final verdict + CTAs</div></div>
                  <div class="yt-algo-item"><div class="yt-algo-dot"><svg width="9" height="9" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="3.5"><polyline points="20 6 9 17 4 12"></polyline></svg></div><div><strong>CTA placement:</strong> Subscribe at 0:15 + 3:00. Affiliate mention at each product chapter (not end-only). Pinned comment with 3 emoji links. Info card at 75% mark linking to your blog article.</div></div>
                </div>
              </div>
            </div>
'@

# ─── Build insertions map (1-indexed line numbers) ────────────────────────────
$insertions = @{
    1193 = ($css -split "`r?`n")
    2047 = ($serp -split "`r?`n")
    2180 = ($authP1 -split "`r?`n")
    2252 = ($paceP1 -split "`r?`n")
    2452 = ($authP2 -split "`r?`n")
    2489 = ($paceP2 -split "`r?`n")
    2568 = ($authP3 -split "`r?`n")
    2598 = ($paceP3 -split "`r?`n")
    2677 = ($authP4 -split "`r?`n")
    2706 = ($paceP4 -split "`r?`n")
    2785 = ($authP5 -split "`r?`n")
    2814 = ($paceP5 -split "`r?`n")
    2903 = ($synthesis -split "`r?`n")
}

# ─── Single-pass splice ────────────────────────────────────────────────────────
$result = [System.Collections.ArrayList]::new()
for ($i = 0; $i -lt $lines.Count; $i++) {
    [void]$result.Add($lines[$i])
    $lineNum = $i + 1
    if ($insertions.ContainsKey($lineNum)) {
        foreach ($newLine in $insertions[$lineNum]) {
            [void]$result.Add($newLine)
        }
    }
}

[System.IO.File]::WriteAllLines($file, $result, [System.Text.Encoding]::UTF8)
"Done. Total lines: $($result.Count)"
